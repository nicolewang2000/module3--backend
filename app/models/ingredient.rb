class Ingredient < ApplicationRecord
    has_many :drinks
    has_many :drink_ingredients
    has_many :drinks, through: :drink_ingredients
    validates :name, :case_sensitive => false
end
