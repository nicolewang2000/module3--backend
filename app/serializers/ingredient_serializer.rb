class IngredientSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name
  # has_many :drink_ingredients
  # has_many :drinks, through: :drink_ingredients
end
