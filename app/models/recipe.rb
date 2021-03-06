class Recipe < ApplicationRecord

  validates :title, :ingredients, :description, :author, presence: true
  validates :category, presence: true
  validates :user, presence: true

  belongs_to :user
  belongs_to :category

  has_rich_text :description
  has_rich_text :ingredients

  has_one_attached :photo

  accepts_nested_attributes_for :category

  scope :latest, ->(number) { last("?", number) }
  scope :category, ->(category_id) { where("category_id = ?", category_id) }
  scope :random, -> { order('RANDOM()').first }

  include PgSearch::Model
  pg_search_scope :search_by_title_and_ingredients_and_author,
  against: [ :title, :author],
  associated_against: {
    rich_text_ingredients: [:body],
    rich_text_description: [:body]
  },
  using: {
    tsearch: { prefix: true }
  }

end
