class Recipe < ApplicationRecord

  validates :title, :ingredients, :description, :author, presence: true
  validates :category, presence: true
  validates :user, presence: true

  belongs_to :user
  belongs_to :category

  scope :latest, ->(number) { last("?", number) }
  scope :category, ->(category_id) { where("category_id = ?", category_id) }
  scope :random, -> { order('RANDOM()').first }

end
