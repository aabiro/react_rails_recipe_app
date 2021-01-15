class CreateIngredients < ActiveRecord::Migration[6.0]
  def up 
    create_table :ingredients do |t|
      t.string :name
    end
    add_index :ingredients, :id
  end

  def down 
    drop_table :ingredients if table_exists?(:ingredients)
    remove_index :ingredients, name: "index_ingredients_on_id" if index_exists?(:ingredients, :id) 
  end
end
