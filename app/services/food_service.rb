class FoodService
  def get_foods_by_search(query)
    get_url("/fdc/v1/foods/search?query=#{query}")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.nal.usda.gov") do |faraday|
      faraday.params['api_key'] = ENV['FDC_API_KEY']
    end
  end
end