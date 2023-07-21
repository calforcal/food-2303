require "rails_helper"

RSpec.describe FoodService do
  describe "instance methods" do
    describe "#get_foods_by_search" do
      it "gets all food results based on a search" do
        query = "sweet potatoes"
        search = FoodService.new.get_foods_by_search(query)
        expect(search).to be_a Hash
        food_data = search[:foods]

        expect(food_data).to have_key(:gtinUpc)
        expect(food_data[:gtinUpc]).to be_a String
        
        expect(food_data).to have_key(:description)
        expect(food_data[:description]).to be_a String

        expect(food_data).to have_key(:brandOwner)
        expect(food_data[:brandOwner]).to be_a String

        expect(food_data).to have_key(:ingredients)
        expect(food_data[:ingredients]).to be_a String
      end
    end
  end
end