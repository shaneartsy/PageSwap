class CatalogItem < ApplicationRecord
  belongs_to :user
  belongs_to :book
  before_destroy :remove_requests
  # validates :user_summary, length: { in: 10..200 }
  # validates :available, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def remove_requests
    Request.where(buyer_item_id: self.id).destroy_all
    Request.where(seller_item_id: self.id).destroy_all
  end
end
