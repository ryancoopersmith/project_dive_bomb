class ReviewsController < ApplicationController
  def new
    unless current_user.reviews
      @bar = Bar.find(params[:id])
      @review = Review.new
    else
      flash[:notice] = "You cannot submit more than one review"
      render 'bars/show'
    end
  end

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

  def edit
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

  def destroy
    @review = Review.find_by(user: current_user)
    @review.destroy
    flash[:notice] = "Review deleted successfully"
    render 'bars/show'
  end

  private

  def reviews_params
    params.require(:review).permit(:drinks, :food, :entertainment, :vibe, :setting, :description, :user_id, :bar_id, :votes)
  end
end
