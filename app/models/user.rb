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
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  multisearchable against: [:first_name, :email]

  def received_reviews
    user_reviews = UserReview.where(receiver_id: self.id)
  end

  def average_rating
    ratings = received_reviews.map { |review| review.rating}
    if ratings.empty?
      0
    else
      ratings.sum / ratings.count
    end
  end
end
