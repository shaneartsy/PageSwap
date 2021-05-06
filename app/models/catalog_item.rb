class CatalogItem < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :requests
end
