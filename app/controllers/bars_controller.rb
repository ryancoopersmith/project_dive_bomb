class BarsController < ApplicationController
  def index
    @bars = Bar.search(params[:term])
  end

  def show
    @bar = Bar.find(params[:id])
  end
  def create
  end

  protected

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

  private

  def bars_params
    params.require(:bar).permit(:name, :address, :city, :state, :zip, :term)
  end
end
