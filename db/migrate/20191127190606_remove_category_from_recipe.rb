class RemoveCategoryFromRecipe < ActiveRecord::Migration[6.0]
  def change
    remove_column :recipes, :category
  end
end
