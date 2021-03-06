class ReviewsController < ApplicationController
  def index
    @reviews.all
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    if @review.save
      redirect_to restaurant_path(@review.restaurant)
    else
      render 'new'
    end
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
