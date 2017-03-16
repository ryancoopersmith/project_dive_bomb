class BarsController < ApplicationController
  before_action :authorize_user, except: [:index, :show]

  def index
    @bars = Bar.search(params[:term])
  end

  def show
    @bar = Bar.find(params[:id])
    @reviews = @bar.reviews
    admin_review = @reviews.select { |review| review.user.admin == true }
    @admin_review = admin_review[0]
    @user_reviews = @reviews.select { |review| review.user.admin == false }
    sum = 0
    @reviews.each do |review|
      unless review.user.admin?
        review.drinks *= 1.5
        review.food *= 0.5
        review.entertainment *= 0.5
        review.vibe *= 1.25
        review.setting *= 1.25
        sum += (review.drinks + review.food + review.entertainment + review.vibe + review.setting)
      end
    end

    @user_avg_rating = if sum < 1
                         "No user has reviewed this dive yet"
                       else
                         sum / 5.0
                       end
  end

  def new
    @bar = Bar.new
  end

  def create
    @bars = Bar.search(params[:term])
    @bar = Bar.new(bars_params)

    if @bar.save
      flash[:notice] = "Bar Added Successfully"
      redirect_to @bar
    else
      flash[:notice] = @bar.errors.full_messages
      render action: "new"
    end
  end

  def edit
    @bar = Bar.find(params[:id])
  end

  def update
    @bar = Bar.find(params[:id])
    @bar.assign_attributes(bars_params)

    if @bar.valid?
      @bar.save
      flash[:notice] = "Bar Edited Successfully"
      redirect_to @bar
    else
      flash[:notice] = @bar.errors.full_messages
      render action: 'edit'
    end
  end

  def destroy
    @bar = Bar.find(params[:id])
    @bar.delete

    flash[:notice] = "Bar Deleted Successfully"
    redirect_to root_path
  end

  protected

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      flash[:notice] = "This page doesn't exist"
      redirect_to root_path
    end
  end

  private

  def bars_params
    params.require(:bar).permit(:name, :address, :phone_number, :url, :image_url, :city, :state, :zip, :term)
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      flash[:notice] = "This page doesn't exist"
      redirect_to root_path
    end
  end
end
