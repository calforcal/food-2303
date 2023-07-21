require "rails_helper"

RSpec.describe "Home Page", type: :feature do
  describe "happy paths" do
    it "has a search form that redirects to foods page", :vcr do
      visit root_path

      expect(page).to have_field(:q)
      fill_in("q", with: "sweet potatoes")
      click_on("Search")

      expect(current_path).to eq(foods_path)
    end
  end
end