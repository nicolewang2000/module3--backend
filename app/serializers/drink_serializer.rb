class DrinkSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :direction, :image, :glass, :alcoholic
  has_many :drink_ingredients
  has_many :ingredients, through: :drink_ingredients
end

