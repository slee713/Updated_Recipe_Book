class Recipe < ApplicationRecord
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients

    validates :name, :difficulty, :duration_in_min, presence: true
    validates :name, uniqueness: {case_sensitive: false}

    def nice_veg
        if self.vegetarian
            return "Yes"
        else
            return "No"
        end
    end

    def cap_difficulty
        self.difficulty.titlecase
    end
end
