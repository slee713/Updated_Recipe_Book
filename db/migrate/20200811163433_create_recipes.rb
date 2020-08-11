class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :duration_in_min
      t.string :difficulty
      t.boolean :vegetarian

      t.timestamps
    end
  end
end
