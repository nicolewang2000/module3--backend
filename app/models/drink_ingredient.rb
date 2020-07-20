class DrinkIngredient < ApplicationRecord
  belongs_to :drink
  belongs_to :ingredient
  
  def measurement
  end
end
