class Api::V1::BarsController < ApiController
  def index
    render json: Bar.search(params[:term])
  end
end
