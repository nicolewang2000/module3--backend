class Drink < ApplicationRecord
    has_many :ratings
    has_many :drink_ingredients
    has_many :ingredients, through: :drink_ingredients
    
    def ingredient_names
        self.drink_ingredients.map{|dr|dr.ingredient.name}
        # self.ingredients.map{|i|i.name}
    end

    def ingredient_num
        self.ingredient_names.length
    end

    def measurements
        self.drink_ingredients.map{|dr| dr['measurement']}  
    end

    def im # ingredient with measurements
        self.drink_ingredients.map{|dr|dr.ingredient.name + ', ' + dr['measurement']}
    end

    def alcohol_presence
        self.alcoholic ? "Yes" : "No"
    end


end
