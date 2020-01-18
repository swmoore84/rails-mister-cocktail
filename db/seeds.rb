require 'open-uri'
require 'json'

Ingredient.destroy_all

open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list') do |ingredients|
  ingredients.read.each_line do |ingredient|
    items = JSON.parse(ingredient)['drinks']
    items.each do |item|
      name = item['strIngredient1']
      Ingredient.create(name: name)
    end
  end
end
