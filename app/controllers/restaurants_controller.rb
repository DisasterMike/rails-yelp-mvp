class RestaurantsController < ApplicationController
  before_action :get_restaurant, only: [:show]

  def index
    # raise
    @restaurants = Restaurant.all
    @pics = []
    @restaurants.each do |restaurant|
      @pics << get_restaurant_pic(restaurant.category)
    end
  end

  def show
    @reviews = @restaurant.reviews
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    # raise
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def get_restaurant
    @restaurant = Restaurant.find(params[:id])
    @pic = get_restaurant_pic(@restaurant.category)
  end

  FOOD_IMG = {
    japanese: "Japanese.jpg",
    belgian: "belgian.jpg",
    french:  "french.jpeg",
    chinese:  "chinese.jpg",
    italian:  "italian.jpg"
  }

  def get_restaurant_pic(category)
    case category
    when "japanese"
      FOOD_IMG[:japanese]
    when "belgian"
      FOOD_IMG[:belgian]
    when "chinese"
      FOOD_IMG[:chinese]
    when "french"
      FOOD_IMG[:french]
    when "italian"
      FOOD_IMG[:italian]
    else
      nil
    end
  end
end
