class FoodFacade
  def initialize(search=nil)
    @search = search
  end

  def food_finder
    service = FoodService.new
    json = service.food_finder(@search)

    top_10 = json[:foods].slice(0,10)

    top_10.map { |result| Food.new(result) }
  end

  def total_results
    service = FoodService.new
    json = service.food_finder(@search)

    json[:totalHits]
  end
end