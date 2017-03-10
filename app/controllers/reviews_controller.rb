class ReviewsController < ApplicationController
  def create
    @review = Review.new(reviews_params)
    @bar = @review.bar
    if @review.save
      flash[:notice] = "Review added successfully"
    else
      flash[:notice] = @review.errors.messages
    end
    render 'bars/show'
  end

  def update
    @review = Review.assign_attributes(reviews_params)
    @bar = review.bar
    if @review.save
      flash[:notice] = "Review updated successfully"
    else
      flash[:notice] = @review.errors.messages
    end
    render 'bars/show'
  end

  private

  def reviews_params
    params.require(:review).permit(:drinks, :food, :entertainment, :vibe, :setting, :description, :user_id, :bar_id, :votes)
  end
end
