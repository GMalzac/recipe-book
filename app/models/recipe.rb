class Recipe < ApplicationRecord
  RECIPE_CATEGORIES = ["Entrées et apéros", "Plats principaux végétariens", "Plats principaux de viande", "Plats principaux de poisson", "Desserts"]

  validates :title, :ingredients, :description, :author, presence: true
  validates :category, inclusion: { in: RECIPE_CATEGORIES }

  belongs_to :user
  belongs_to :category

  scope :latest, ->(number) { last("?", number) }
  scope :category, ->(category) { where("category LIKE ?", category) }
  scope :random, -> { order('RANDOM()').first }

  # .order('RANDOM()').first

end
