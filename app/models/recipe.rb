class Recipe < ApplicationRecord
  validates :title, :ingredients, :description, :author, presence: true
end
