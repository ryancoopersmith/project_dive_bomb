class Api::V1::BarsController < ApiController
  def index
    render json: Bar.all
  end
end
