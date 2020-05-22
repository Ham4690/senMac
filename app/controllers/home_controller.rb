class HomeController < ApplicationController
  def top
    @basket = nil
    puts @basket
  end

  def select
    @basket = 1
    puts @basket
    render "top"
  end
end
