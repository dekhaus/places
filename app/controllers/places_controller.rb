class PlacesController < ApplicationController
  respond_to :json

  def index
    if params[:_page] || (params[:_start] && params[:_end])
      if params[:_page]
        page    = params[:_page].to_i
        perPage = (params[:_perPage] || 25).to_i
      else
        page    = params[:_start].to_i + 1
        perPage = params[:_end].to_i - params[:_start].to_i
      end
      @places = Place.all.page(page).per_page(perPage)
    else
      @places = Place.all
    end
    response.headers['X-Total-Count'] = Place.count.to_s
    render json: @places
  end

end
