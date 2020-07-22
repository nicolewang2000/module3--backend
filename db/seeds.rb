classes = [DrinkIngredient, Rating, Drink, User, Ingredient]
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

User.create(name: "Nicole Wang", username:"iamnicole")
User.create(name: "Annalise Hunt", username:"annahere")
User.create(name: "Madelyn Smith", username:"itsmaddy")
User.create(name: "Olivia Grace", username:"livie")
User.create(name: "John Smith", username:"johnsmith")


Drink.all.each{|drink| Rating.create(drink_id: drink.id, user_id: 1, score: 4)}

Rating.create(drink_id: 1, user_id: 2, score: 5)
Rating.create(drink_id: 1, user_id: 3, score: 1)
Rating.create(drink_id: 1, user_id: 4, score: 3)
Rating.create(drink_id: 1, user_id: 5, score: 2)
Rating.create(drink_id: 2, user_id: 2, score: 1)
Rating.create(drink_id: 2, user_id: 3, score: 3)
Rating.create(drink_id: 3, user_id: 3, score: 1)
Rating.create(drink_id: 3, user_id: 4, score: 2)
Rating.create(drink_id: 4, user_id: 3, score: 2)
Rating.create(drink_id: 5, user_id: 2, score: 1)
Rating.create(drink_id: 5, user_id: 5, score: 3)
Rating.create(drink_id: 158, user_id: 4, score: 5)

