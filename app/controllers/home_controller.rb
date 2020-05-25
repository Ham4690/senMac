class HomeController < ApplicationController
  def top
    @itemInfos = []
    puts @basket
  end

  def select
    dataNum = TestHambarger.count
    # timeNow = Time.now
    firstId = rand(1..dataNum)
    item = TestHambarger.find_by id: firstId
    
    itemNum = 0
    @goods = []
    @itemInfos = [setItemInfo(item)]

    @totalCost = @itemInfos[itemNum][:price]
    nowMoney = MONEY - @totalCost
    puts nowMoney
    menu = TestHambarger.where(["price < ?", nowMoney])

    while menu.present?
      selectNum = rand(0..menu.count-1)
      puts menu
      @itemInfos << setItemInfo(menu[selectNum])
      itemNum += 1
      @totalCost += @itemInfos[itemNum][:price]
      nowMoney = MONEY - @totalCost
      puts nowMoney
      menu = TestHambarger.where(["price < ?", nowMoney])
    end

    @totalNutrients = setTotalNutrients(@itemInfos)
    render "top"
  end

  def isMorning(now)
  end

  def isDinner(now)
  end

  def setItemInfo(data)
    info = {}
    info[:name] = data.name
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
    
end
