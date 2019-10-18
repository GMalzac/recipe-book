class AddAuthorToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :author, :string
  end
end
