class AddCategoryToRecipe < ActiveRecord::Migration[6.0]
  def change
    add_reference :recipes, :category, foreign_key: true
  end
end
