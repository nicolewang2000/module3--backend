classes = [DrinkIngredient, Drink, User, Ingredient, Rating]
classes.each{|c|
    c.destroy_all 
    c.reset_pk_sequence
}

response1 = HTTParty.get('https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic').parsed_response
response2 = HTTParty.get('https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic').parsed_response
# returns array of all the cocktail IDS
ids = response1['drinks'].map{|d|d['idDrink']}.concat(response2['drinks'].map{|d|d['idDrink']})

def get_info(id)
    HTTParty.get("https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{id}").parsed_response
end

ids.map{|id|
    # Get a hash of the drink info
    info = get_info(id)["drinks"][0]
    drink = Drink.create(
        name: info["strDrink"], 
        alcoholic: !info['strAlcoholic'].include?('Non'),
        direction: info["strInstructions"],
        image: info["strDrinkThumb"],
        glass: info["strGlass"])
    # Gets array of all ingredients 
    ingredients = info.keys.select{|k|k.include?('strIngredient') && !info[k].nil?}.map {|k| info[k]}
    measurements = info.keys.select{|k|k.include?('strMeasure') && !info[k].nil?}.map {|k| info[k]}
    ingredients.each{|i| 
        ingredient = Ingredient.find_or_create_by(name: i)
        DrinkIngredient.create(drink: drink, ingredient: ingredient, measurement: measurements[ingredients.index(ingredient.name)])
    }
}


