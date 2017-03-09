class BarsController < ApplicationController
  def index
    @bars = Bar.search(params[:term])
  end

  def show
    @bar = Bar.find(params[:id])
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
      redirect_to @bar
    else
      flash[:notice] = @bar.errors.full_messages
      render action: 'edit'
    end
  end

  def destroy
    @bar = Bar.find(params[:id])
    @bar.delete

    flash[:notice] = "#{@bar.name} deleted."
    redirect_to root_path
  end

  protected

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

  private

  def bars_params
    params.require(:bar).permit(:name, :address, :phone_number, :url, :image_url, :city, :state, :zip, :term)
  end
end
