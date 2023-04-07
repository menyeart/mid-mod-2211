require "rails_helper"

RSpec.describe FoodsFacade do
  before :each do
    food = 'sweet potatoes'
    @facade = FoodsFacade.new("sweet potatoes")
  end

  describe "#initialize" do
    it "exists" do
      expect(@facade).to be_an_instance_of(FoodsFacade)
    end
  end

  describe "methods" do
    it "lists the total number of items returned" do
      expect(@facade.total_items).to eq(51270)
    end

    it "returns an array of food objects with their attributes" do
      expect(@facade.food_search.count).to eq(10)
      @facade.food_search.each do |food|
        expect(food.code).to be_a(String)
        expect(food.description).to be_a(String).or eq(nil)
        expect(food.brand_owner).to be_a(String)
        expect(food.ingredients).to be_a(String)
      end
    end
  end
end