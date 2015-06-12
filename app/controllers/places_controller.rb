class PlacesController < ApplicationController
  respond_to :json

  def index
    @places = if params[:_page]
      page    = params[:_page].to_i
      perPage = (params[:_perPage] || 25).to_i
      Place.all.page(page).per_page(perPage)
    else
      Place.all
    end

    response.headers['X-Total-Count'] = @places.count.to_s
    render json: @places
  end

end
