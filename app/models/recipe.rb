class Recipe < ApplicationRecord
  RECIPE_CATEGORIES = ["Entrées et apéros", "Plats principaux végétariens", "Plats principaux de viande", "Plats principaux de poisson", "Desserts"]

  validates :title, :ingredients, :description, :author, presence: true
  validates :category, inclusion: { in: RECIPE_CATEGORIES }

end
