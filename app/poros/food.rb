class Food
  attr_reader :code, :description, :brand, :ingredients
  def initialize(details)
    @code = details[:gtinUpc]
    @description = details[:description]
    @brand = details[:brandOwner]
    @ingredients = details[:ingredients]
  end
end