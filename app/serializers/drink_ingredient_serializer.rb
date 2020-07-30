class DrinkIngredientSerializer < ActiveModel::Serializer
  attributes :measurement
  belongs_to :drink
  belongs_to :ingredient
end
