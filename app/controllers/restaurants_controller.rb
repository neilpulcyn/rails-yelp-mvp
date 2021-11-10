class RestaurantsController < ApplicationController
  # GET /restaurants - displays the restaurants
  before_action :set_restaurant, only: [:show]

  def index
    @restaurants = Restaurant.all
  end

  # GET/restaurants/1
  def show; end

  def new
    # we create a new instance of restaurant via a form which was coded on the HTML.erb file
    @restaurant = Restaurant.new
  end

  def create
    # we create the restaurant using strong params as a parameter to stop sneaky injection/hacking
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render :new # throws error message?
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
