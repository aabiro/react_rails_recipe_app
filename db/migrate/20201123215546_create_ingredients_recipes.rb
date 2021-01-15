class CreateIngredientsRecipes < ActiveRecord::Migration[6.0]
  def up
    create_table :ingredients_recipes do |t|
      t.integer :ingredient_id
      t.integer :recipe_id
    end
  end

  def down 
    drop_table :ingredients_recipes if table_exists?(:ingredients_recipes)
  end
end
