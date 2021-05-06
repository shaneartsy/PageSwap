class UserReview < ApplicationRecord
  belongs_to :author
  belongs_to :receiver
end
