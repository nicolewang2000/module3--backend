class Drink < ApplicationRecord
    has_many :ratings
    has_many :drink_ingredients
    has_many :ingredients, through: :drink_ingredients
    
    def ingredient_name
        self.drink_ingredients.map{|dr|dr.ingredient.name}
        # self.ingredients.map{|i|i.name}
    end

    def ingredient_amount
        self.drink_ingredients.map{|dr| dr['measurement']}  
    end

    def ingredient_name_amount
        self.drink_ingredients.map{|dr|dr.ingredient.name + ', ' + dr['measurement']}
    end

end
