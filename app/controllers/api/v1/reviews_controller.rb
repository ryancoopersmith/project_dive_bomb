class Api::V1::BarsController < ApiController
  def index
    render json: Review.all
  end
end
