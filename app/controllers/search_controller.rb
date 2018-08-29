class SearchController < ApplicationController

  def index
    @presenter = Presenter.new(params[:q]).closest_fuel_stations
  end
end
