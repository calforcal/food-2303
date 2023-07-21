require "rails_helper"

RSpec.describe FoodFacade do
  describe "Food" do
    describe "#food_finder" do
      it "can return top 10 foods based on a search" do
        query = "sweet potatoes"
        foods = FoodFacade.new(query).food_finder

        foods.each do |food|
          expect(food).to be_a Food
          expect(food.code).to be_a String
          expect(food.description).to be_a String
          expect(food.brand).to be_a String
          expect(food.ingredients).to be_a String
        end
      end
    end

    describe "#total_results" do
      it "can return the total number of search results" do
        query = "sweet potatoes"
        num = FoodFacade.new(query).total_results

        expect(num).to be_an Integer
      end
    end
  end
end