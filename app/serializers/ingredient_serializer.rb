class IngredientSerializer < ActiveModel::Serializer
  attributes :id, :name
  # has_many :drink_ingredients
  # has_many :drinks, through: :drink_ingredients
end
