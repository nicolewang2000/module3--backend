class DrinkSerializer < ActiveModel::Serializer
  attributes :id, :name, :direction, :image, :glass, :alcoholic
  has_many :drink_ingredients
  has_many :ingredients, through: :drink_ingredients
  has_many :ratings
end

