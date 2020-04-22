class CoffeeShopsController < ApplicationController

  def index
    @coffee_shops = CoffeeShop.all 
    render json: @coffee_shops
  end

  def show
    @coffee_shop = CoffeeShop.find(params[:id])
    render json: @coffee_shop
  end

  def create
    @coffee_shop = CoffeeShop.create(
      name: params[:name],
      location: params[:location],
      capacity: params[:capacity]
    )
    render json: @coffee_shop
  end

end
