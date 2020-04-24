class CoffeeShopsController < ApplicationController
  before_action :find_coffee_shop_by_id, only: [:show, :update, :destroy]

  def index
    @coffee_shops = CoffeeShop.all 
    render json: @coffee_shops, include: :coffees
  end

  def show
    render json: @coffee_shop, include: :coffees
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
    render json: @coffee_shop, include: :coffees
  end

  def destroy
    @coffee_shop.destroy 
    render json: {message: "Successfully destroyed the coffee shop"}
  end

  private

  def find_coffee_shop_by_id
    @coffee_shop = CoffeeShop.find(params[:id])
  end

end

# code 39, if it weren't there, it woudl be in show update and destroy
# repetitive- before action method
  # before it hits the action method, it will run find_coffee_shop_by_id first
  # limit before actions as well just like routes.
  # we do not coffee shop to be defined in create action because we are creating a new instance - we do not have an id. it would break code.
  # private keyword - can throw prvate in any key class. limits the availabilitly of anything defined below it to class which it is contained. 
    # any methods I write under private kehyword- only accessed by coffeshop controller. 
    # cannot be accessed by browser 

    # sending http request from front to backend - slowet componetn of app
    # rails helps you minimize # of requests it ahs to serve up, include
     # allow you to include any related associations ina single fetch request 
      # if I include coffe in coffeeshop, when I send the intiial request to get all of my coffeshops, I get all info for that coffee shop, also get associated coffees with that coffee shop with that request
        # minimizes how many times the requests go back and foruth - briing batch of info rather than a single piece of info 