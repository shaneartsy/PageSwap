require "open-uri"

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about_us, :faq]

  def home
    @users = User.all
    @requests = Request.all.sort_by { |request| request.updated_at }
    @requests.reverse!
    @items = CatalogItem.all
    @markers = @items.geocoded.map do |item|
      {
        lat: item.latitude,
        lng: item.longitude
      }
    end
    puts params
    @results = []
    if params[:query].present?
      results = PgSearch.multisearch(params[:query])
      if results.length != 0
        results.each do |result|
          @results << result.searchable
        end
      elsif (URI.open("https://www.googleapis.com/books/v1/volumes?q=#{params[:query]}").read)
        file = URI.open("https://www.googleapis.com/books/v1/volumes?q=#{params[:query]}").read
        book_response = JSON.parse(file)
        books = book_response['items'][1..4]
        books.each do |book|
          book1 = book['volumeInfo']
          title = book1['title']
          author = book1['authors']
          if author
            author = author.first
          end
          description = book1['description']
          category = book1["categories"]
          if category
            category = category.first
          end
          if book1['averageRating']
            rating = book1['averageRating']
          end
          new_book = Book.new(title: title, author: author, summary: description, category: category, rating: rating)
          if book1['imageLinks']
            image_url = book1['imageLinks']['thumbnail']
            file_image = URI.open(image_url)
            new_book.photo.attach(io: file_image, filename: "nes.png", content_type: 'image/png')
          end
          new_book.save
          @results << new_book
        end
      end
    else
      @results = nil
    end
  end

  def user_page
    @user = User.find(params[:user_id])
    @items = @user.catalog_items
  end

  def about_us
  end

  def faq
  end

  def new
    @user_reviews = UserReview.new

  end
end
