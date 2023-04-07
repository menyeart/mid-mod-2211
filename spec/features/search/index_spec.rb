require "rails_helper"

RSpec.describe "Food Search Feature" do
  describe "As a user" do
    it "when I visit '/' and search with 'sweet potatoes' and click seach, then I should be on page '/foods'. Then I should see the total number of items returned as well as a list of ten foods that contain sweet potatoes with their attributes" do
      visit root_path
      fill_in "q", with: "sweet potatoes"
      click_button "Search"

      expect(current_path).to eq(foods_path)
      expect(page).to have_content("Total Foods Count: 51270")
      expect(page).to have_content("GTIN/UPC: 8901020020844")
      expect(page).to have_content("Description: SWEET POTATOES", count: 10)
      expect(page).to have_content("Brand Owner: NOT A BRANDED ITEM")
      expect(page).to have_content("Ingredients: ORGANIC SWEET POTATOES.")
    end
  end
end