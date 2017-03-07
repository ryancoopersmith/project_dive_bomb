class BarsController < ApplicationController
  def index
    @bars = Bar.all
  end

  def show
    @bar = Bar.find(params[:id])
  end

  protected

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
