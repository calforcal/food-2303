class FoodsController < ApplicationController
  def index
    search = params[:q]

    @display_results = FoodFacade.new(search).food_finder
    @total_results = FoodFacade.new(search).total_results
    @search = search.titleize
  end
end