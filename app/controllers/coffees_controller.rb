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

# json: requires an object - can put message in palce. 
# send through empty fields, not chekcing anythign as it's being processed. grabbing info and sending it to db
# coffee controller- more defensive
  # create instance- 
    # becuase we have this requirement (null false) to make sure that a user provides a coffeeshop id
      # create - new and save actions in one
        # create a new instance locally
        # 20 if this coffee instance successfuly saves to our db, then we will render json of that coffee instance
        # otherwise, we are going to render status 422
          # allwos you to leverage predefined http status codes- do not memorize- google
          #422- unprocessable entity- everythign formatted correctly(syntax) what you sent back does not allow it be saved in database. somethign is missing or worng. 
          # new coffee form filled out and sent a post request to our coffees to see if we can get that to save
            # receives request, router - hey we are recevigin this request from local host and
            # rails routes
            # only check we are applying right now, coffee shop id is supplied as part of tose parameters. everythign else can be blank as long as there's coffee shop id. 