class CatalogItem < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :requests

  # validates :user_summary, length: { in: 10..200 }
  # validates :available, presence: true
end
