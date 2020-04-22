class CoffeesController < ApplicationController
  before_action :find_coffee_by_id, only: [:show, :update, :destroy]

  def index
    @coffees = Coffee.all 
    render json: @coffees
  end

  def show
    render json: @coffee 
  end

  def create
    @coffee = Coffee.new(
      name: params[:name],
      roast_type: params[:roast_type],
      strength: params[:strength],
      coffee_shop_id: params[:coffee_shop_id]
    )
    if @coffee.save
      render json: @coffee
    else
      render status: 422
    end
  end
  
  def update 
    @coffee.update(
      name: params[:name],
      roast_type: params[:roast_type],
      strength: params[:strength],
      coffee_shop_id: params[:coffee_shop_id]
    )
    render json: @coffee
  end

  def destroy 
    @coffee.destroy 
    render json: {message: "You successfully destroyed the requested coffee."}
  end

  private

  def find_coffee_by_id
    @coffee = Coffee.find(params[:id])
  end

end
