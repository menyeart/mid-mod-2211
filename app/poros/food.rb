class Food
  attr_reader :code,
              :description,
              :brand_owner,
              :ingredients

  def initialize(info)
    @code = info[:code]
    @description = info[:description]
    @brand_owner = info[:brand_owner]
    @ingredients = info[:ingredients]
  end
end