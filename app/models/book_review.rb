class BookReview < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :content, length: { in: 10..200 }
end
