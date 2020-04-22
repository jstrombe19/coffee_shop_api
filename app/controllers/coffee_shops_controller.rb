class CoffeeShopsController < ApplicationController
  before_action :find_coffee_shop_by_id, only: [:show, :update, :destroy]

  def index
    @coffee_shops = CoffeeShop.all 
    render json: @coffee_shops
  end

  def show
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
    
  def update
    @coffee_shop.update(
      name: params[:name],
      location: params[:location],
      capacity: params[:capacity]
    )
    render json: @coffee_shop
  end

  def destroy
    @coffee_shop.destroy 
    redirect_to action: "index"
  end

  private

  def find_coffee_shop_by_id
    @coffee_shop = CoffeeShop.find(params[:id])
  end

end
