class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  # validates :content, length: { maximum: 100 }
end
