class Ingredient < ApplicationRecord
    validates :name, uniqueness: {case_sensitive: false}
    
    has_many :recipe_ingredients
    has_many :recipes, through: :recipe_ingredients

   
end
