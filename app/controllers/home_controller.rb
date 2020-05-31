class HomeController < ApplicationController
  def top
    @itemInfos = []
    puts @basket
  end

  def select

    t = Time.now
    timeNow = t.strftime("%H%M").to_i
    dbName = checkTime(timeNow)
    dataNum = dbName.count
    firstId = rand(1..dataNum)
    item = dbName.find_by id: firstId
    
    itemNum = 0
    @goods = []
    @itemInfos = [setItemInfo(item)]

    @totalCost = @itemInfos[itemNum][:price]
    nowMoney = MONEY - @totalCost
    puts nowMoney
    menu = dbName.where(["price < ?", nowMoney])

    while menu.present?
      selectNum = rand(0..menu.count-1)
      puts menu
      @itemInfos << setItemInfo(menu[selectNum])
      itemNum += 1
      @totalCost += @itemInfos[itemNum][:price]
      nowMoney = MONEY - @totalCost
      puts nowMoney
      menu = dbName.where(["price < ?", nowMoney])
    end

    @totalNutrients = setTotalNutrients(@itemInfos)
    @tweet_url = createTweetUrl(@itemInfos, @totalNutrients, @totalCost)
    render "top"
  end


  def checkTime(now)
    puts now
    if 500 < now and now <= 1025
      return MorningMenu
    elsif 1025 < now and now <= 1700
      return LunchMenu
    else
      return DinnerMenu
    end
  end

  def setItemInfo(data)
    info = {}
    if data.size 
      info[:name] = data.name + " (" + data.size + ")"
    else
      info[:name] = data.name
    end
    info[:price] = data.price
    info[:calorie] = data.calorie
    info[:protein] = data.protein
    info[:fat] = data.fat
    info[:carbohydrate] = data.carbohydrate
    info[:dietary_fiber] = data.dietary_fiber
    return info
  end

  def setTotalNutrients(datas)
    info = {}
    info[:totalCalorie] = 0
    info[:totalProtein] = 0
    info[:totalFat] = 0
    info[:totalCarbohydrate] = 0
    info[:totalDietary_fiber] = 0

    datas.each do |data|
      info[:totalCalorie] += data[:calorie]
      info[:totalProtein] += data[:protein]
      info[:totalFat] += data[:fat]
      info[:totalCarbohydrate] += data[:carbohydrate]
      info[:totalDietary_fiber] += data[:dietary_fiber]
    end
    return info
  end

  def createTweetUrl(goodsInfos, totalNutrients, totalCost)
    baseUrl = "http://twitter.com/intent/tweet?"
    originUrl = "original_referer=" + request.url
    viewUrl = "&url=" + request.url
    hashtags = "&hashtags=マックガチャ,1000円あったらマックへ行こう"
    text = "1000円マックガチャを回したよ！\n---\n"
    goodsInfos.each do |goodInfo|
      text += goodInfo[:name] + "\n"
    end
    text += "---\n"
    main = "&text=" + text + totalCost.to_s + "円, " + totalNutrients[:totalCalorie].to_s + "[kcal]\n\n" 
    # return URI.encode(baseUrl + originUrl + viewUrl +"&text=" + text + totalCost + "円, " + totalNutrients[:totalCalorie] + "[kcal]")
    return URI.encode(baseUrl + viewUrl + hashtags + main)
    # return URI.encode(baseUrl + "text=test\ntest\ntest")
  end
    
end
