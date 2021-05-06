class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book
  belongs_to :parent, class_name: "Comment"
end
