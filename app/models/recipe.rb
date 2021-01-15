class Recipe < ApplicationRecord
  has_and_belongs_to_many :ingredients

  def self.filter_recipes(ingredient_ids)
      return if ingredient_ids.nil?
      from_sql =
      Recipe.select(:id, :name, 'array_agg( ingredients.id order by ingredients.id) as ingredient_ids')
        .joins("INNER JOIN ingredients_recipes on recipes.id = ingredients_recipes.recipe_id")
        .joins("INNER JOIN ingredients on ingredients.id = ingredients_recipes.ingredient_id")
        .group(:id, :name).to_sql

      Recipe.select('*').from(
          "(#{from_sql}) as t"
        ).where("t.ingredient_ids::int[] @> '{#{ingredient_ids.split(',').join(',')}}'::int[]")
  end
end
