class FoodsFacade
  def initialize
  end

  def total_items(food)
    FoodService.food_search(food)[:totalHits]
  end

  def food_search(food)
    FoodService.food_search(food)[:foods].map do |food|
      Food.new(get_info(food))
    end
  end

  def get_info(food)
    attributes = Hash.new(nil)
    attributes[:code] = food[:gtinUpc]
    attributes[:description] = food[:description]
    attributes[:brand_owner] = food[:brandOwner]
    attributes[:ingredients] = food[:ingredients]
    attributes
  end




end