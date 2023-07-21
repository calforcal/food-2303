require "rails_helper"

RSpec.describe "Foods Index", type: :feature do
  describe "happy paths" do
    before(:each) do
      visit root_path

      expect(page).to have_field(:q)
      fill_in("q", with: "sweet potatoes")
      click_on("Search")
    end

    it "displays the total number of items returned by the search", :vcr do
      expect(page).to have_content("Sweet Potatoes Search Results")
      expect(page).to have_content("Total Results: 55579")
    end

    it "only lists ten foods that contain the ingredient searched", :vcr do
      within ".search-results" do
        expect(page).to have_css(".result", count: 10)
      end
    end

    it "displays information about each result", :vcr do
      within ".search-results" do
        expect(page).to have_css(".result", count: 10)
        expect(page).to have_css(".gtin-upc", count: 10)
        expect(page).to have_css(".description", count: 10)
        expect(page).to have_css(".brand-owner", count: 10)
        expect(page).to have_css(".ingredients", count: 10)
      end
    end
  end
end