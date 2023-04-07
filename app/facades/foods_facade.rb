class FoodsFacade
  def initialize(food)
    @searched_foods ||= FoodService.food_search(food)
  end

  def get_foods
    @searched_foods
  end

  def total_items
    get_foods[:totalHits]
  end

  def food_search
    get_foods[:foods].map do |food|
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