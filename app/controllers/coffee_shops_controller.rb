class CoffeeShopsController < ApplicationController

  def index
    @coffee_shops = CoffeeShop.all 
    render json: @coffee_shops
  end

end
