class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @bar = Bar.find(params[:bar_id])
    if current_user.reviews[0]
      unless current_user.reviews[0].bar_id == @bar.id
        @review = Review.new
      else
        flash[:notice] = "You cannot submit more than one review"
        redirect_to @bar
      end
    else
      @review = Review.new
    end
  end

  def create
    @bar = Bar.find(params[:bar_id])
    @review = @bar.reviews.new(reviews_params)
    @review.user = current_user
    if @review.save
      flash[:notice] = "Review added successfully"
    else
      flash[:notice] = @review.errors.messages
    end
    redirect_to @bar
  end

  def edit
    @bar = Bar.find(params[:bar_id])
    @review = current_user.reviews[0]
  end

  def update
    @review = Review.find(params[:id])
    @review.assign_attributes(reviews_params)
    @bar = @review.bar
    if @review.save
      flash[:notice] = "Review updated successfully"
    else
      flash[:notice] = @review.errors.messages
    end
    redirect_to @bar
  end

  def destroy
    @review = Review.find(params[:id])
    @bar = @review.bar
    @review.delete
    flash[:notice] = "Review deleted successfully"
    redirect_to @bar
  end

  private

  def reviews_params
    params.require(:review).permit(:drinks, :food, :entertainment, :vibe, :setting, :description, :user_id, :bar_id, :votes)
  end
end
