class Drink < ApplicationRecord
    belongs_to :user
    has_many :ratings, dependent: :destroy
    has_many :drink_ingredients,  dependent: :destroy
    has_many :ingredients, through: :drink_ingredients
    # accepts_nested_attributes_for :drink_ingredients 
    # accepts_nested_attributes_for :ingredients 
    
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
