class SearchController < ApplicationController
  def index
    @foods = FoodsFacade.new(params[:q])
  end
end