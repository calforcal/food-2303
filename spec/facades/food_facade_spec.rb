require "rails_helper"

RSpec.describe FoodFacade do
  describe "Food" do
    it "can return all foods based on a search" do
      query = "sweeet potatoes"
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
end