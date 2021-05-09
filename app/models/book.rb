class Book < ApplicationRecord
  has_many :comments
  has_many :book_reviews
  has_many :catalog_items
  has_one_attached :photo
  # has_many :request, through: :catalog_item
end
