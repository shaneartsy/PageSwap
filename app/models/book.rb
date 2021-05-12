class Book < ApplicationRecord
  has_many :comments
  has_many :book_reviews
  has_many :catalog_items
  has_one_attached :photo
  # has_many :request, through: :catalog_item

  include PgSearch::Model
  multisearchable against: [:title, :author, :summary]

  def average_rating
    ratings = received_reviews.map { |review| review.rating}
    ratings_sum = ratings.sum
    ratings_count = ratings.count
    ratings_devied = ratings_sum / ratings.count



    validates :title, presence: true
  end
end


