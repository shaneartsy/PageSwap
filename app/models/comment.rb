class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book
  belongs_to :parent, class_name: "Comment", optional: true

  validates :comments, length: { in: 10..200 }
end
