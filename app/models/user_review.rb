class UserReview < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :receiver, class_name: "User"

  validates :content, length: { in: 10..200 }
end
