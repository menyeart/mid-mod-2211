require "rails_helper"

RSpec.describe FoodService do
  describe "#class methods" do
    describe "get url" do
      it "returns a json object" do
        expect(FoodService.get_url("/fdc/v1//foods/search?query=sweet potatoes&pageSize=10&pageNumber=1")).to be_a(Hash)
      end
    end

    describe "food search" do
      it "searches for foods" do
        foods = FoodService.food_search("sweet potatoes")

        expect(foods).to be_a(Hash)
        expect(foods).to have_key(:foods)
        expect(foods[:foods]).to be_a(Array)
        foods[:foods].each do |food|
          expect(food).to have_key(:gtinUpc)
          expect(food[:gtinUpc]).to be_a(String)
          expect(food).to have_key(:description)
          expect(food[:description]).to be_a(String)
          expect(food).to have_key(:brandOwner)
          expect(food[:brandOwner]).to be_a(String)
          expect(food).to have_key(:ingredients)
        end
      end
    end   
  end
end