# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'rest-client'
Recipe.destroy_all
Ingredient.destroy_all
RecipeIngredient.destroy_all


response = RestClient.get("http://www.recipepuppy.com/api/?i=onions,garlic&q=omelet&p=3")
data = JSON.load(response)

data["results"].each do |recipe|
    a = Recipe.create(name: recipe["title"], duration_in_min: rand(1..100), difficulty: ["easy", "medium", "hard"].sample, vegetarian:[true, false].sample)
        recipe["ingredients"].split(", ").each do |ing_name|
            if Ingredient.find_by(name: ing_name)
                a.ingredients << Ingredient.find_by(name: ing_name)
            else
                a.ingredients << Ingredient.create(name: ing_name)
            end
        end
end


    


















# 10.times do 
#     Recipe.create(name: Faker::Food.dish, duration_in_min: rand(1..100), difficulty: ["easy", "medium", "hard"].sample, vegetarian:[true, false].sample)
# end 


# 30.times do 
#     Ingredient.create(name: Faker::Food.ingredient)
# end

# 50.times do 
#     RecipeIngredient.create(recipe: Recipe.all.sample, ingredient: Ingredient.all.sample)
# end