class FoodsController < ApplicationController
  def index
    search = params[:q]
    conn = Faraday.new(url: "https://api.nal.usda.gov") do |faraday|
      faraday.params['api_key'] = ENV['FDC_API_KEY']
    end

    response = conn.get("/fdc/v1/foods/search?query=#{search}")
    json = JSON.parse(response.body, symbolize_names: true)

    @search = search.titleize
    @total_results = json[:totalHits]
    
    top_10 = json[:foods].slice(0, 10)

    @display_results = top_10.map { |result| Food.new(result) }
  end
end