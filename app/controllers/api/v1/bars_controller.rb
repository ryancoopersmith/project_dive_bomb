class Api::V1::BarsController < ApiController
  def index
    render json: Bar.order(rating: :desc)
  end
end
