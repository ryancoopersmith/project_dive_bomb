class Api::V1::ReviewsController < ReviewsController
  def index
    render json: Review.all
  end
end
