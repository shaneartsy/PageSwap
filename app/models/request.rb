class Request < ApplicationRecord
  belongs_to :user
  belongs_to :buyer_item, class_name: "CatalogItem"
  belongs_to :seller_item, class_name: "CatalogItem", optional: true
  has_one :book, through: :catalog_item
end
