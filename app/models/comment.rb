class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book
  belongs_to :parent, class_name: "Comment", optional: true

  # validates :content, length: { in: 10..200 }
end
