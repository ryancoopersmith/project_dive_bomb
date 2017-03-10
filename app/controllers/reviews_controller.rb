class ReviewsController < ApplicationController
  def create
    @review = Review.new(reviews_params)
    if @review.save
    end
  end

  def update
  end

  private

  def reviews_params
    params.require(:review).permit(:drinks, :food, :entertainment, :vibe, :setting, :description, :user_id, :bar_id, :votes)
  end
end
