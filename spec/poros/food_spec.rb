require "rails_helper"

RSpec.describe Food do
  it "exists" do
    attrs = {
      gtinUpc: "8901020020844",
      description: "SWEET POTATOES",
      brandOwner: "NOT A BRANDED ITEM",
      ingredients: "ORGANIC SWEET POTATOES."
    }

    food = Food.new(attrs)

    expect(food).to be_a(Food)
    expect(food.code).to eq("8901020020844")
    expect(food.description).to eq("SWEET POTATOES")
    expect(food.brand).to eq("NOT A BRANDED ITEM")
    expect(food.ingredients).to eq("ORGANIC SWEET POTATOES.")
  end
end