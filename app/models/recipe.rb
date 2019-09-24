class Recipe < ApplicationRecord
  validates :title, :ingredients, :description, presence: true
end
