class ReviewsController < ApplicationController
  def create
    @review = Review.new(reviews_params)
    if @review.save
      flash[:notice] = "Review added successfully"
      redirect_to @review
    else
      flash[:notice] = @review.errors.messages
      redirect_to new_bar_review_path(@bar)
    end
  end

  def update
  end

  private

  def reviews_params
    params.require(:review).permit(:drinks, :food, :entertainment, :vibe, :setting, :description, :user_id, :bar_id, :votes)
  end
end
