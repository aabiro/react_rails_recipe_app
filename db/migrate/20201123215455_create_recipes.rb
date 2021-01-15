class CreateRecipes < ActiveRecord::Migration[6.0]
  def up
    create_table :recipes do |t|
      t.string :name
    end
    add_index :recipes, :name
    add_index :recipes, :id
  end

  def down
    drop_table :recipes if table_exists?(:recipes)
    remove_index :recipes, name: "index_recipes_on_name" if index_exists?(:recipes, :name) 
    remove_index :recipes, name: "index_recipes_on_name" if index_exists?(:recipes, :id) 
  end
end
