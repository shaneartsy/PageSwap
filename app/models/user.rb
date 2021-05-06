class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :catalog_items
  has_many :book_reviews
  # has_many :user_reviews
  # has_many :messages
  has_many :requests
  has_many :comments
  has_many :books, through: :catalog_items
end
