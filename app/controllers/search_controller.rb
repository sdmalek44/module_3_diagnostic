class SearchController < ApplicationController

  def index
    @presenter = Presenter.new(params[:q])
  end
end
