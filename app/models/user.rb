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

  def received_reviews
    user_reviews = UserReview.where(receiver_id: self.id)
  end

def average_rating
ratings = received_reviews.map { |review| review.rating}
ratings_sum = ratings.sum
ratings_count = ratings.count
ratings_devied = ratings_sum / ratings.count

  include PgSearch::Model
  multisearchable against: [:first_name, :email]
end
  end

