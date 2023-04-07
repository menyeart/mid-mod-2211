class FoodService
  def self.conn
    Faraday.new(url: "https://api.nal.usda.gov") do |faraday|
      faraday.params["api_key"] = ENV["food_key"]
    end
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.food_search(name)
    get_url("/fdc/v1//foods/search?query=#{name}&pageSize=10&pageNumber=1")
  end
end