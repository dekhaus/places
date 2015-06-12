class PlacesController < ApplicationController
  respond_to :json

  def index
    if params[:_page]
      page    = params[:_page].to_i
      perPage = (params[:_perPage] || 25).to_i
      @places = Place.all.page(page).per_page(perPage)
    elsif params[:_start] && params[:_end]
      page      = params[:_start].to_i + 1
      perPage  = params[:_end].to_i - params[:_start].to_i
      @places = Place.all.page(page).per_page(perPage)
    else
      @places = Place.all
    end
    response.headers['X-Total-Count'] = @places.to_a.count.to_s
    render json: @places
  end

end
