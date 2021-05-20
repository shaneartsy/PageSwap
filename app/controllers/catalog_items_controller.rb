class CatalogItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @user = User.find(params[:user_id])
    @items = @user.catalog_items
    @chatroom = Chatroom.all.filter { |room| (room.user1 == current_user && room.user2 == @user) || (room.user2 == current_user && room.user1 == @user) }
    if @chatroom.empty?
      @chatroom = Chatroom.new(user1: @user)
      @chatroom.user2 = current_user
      @chatroom.save
    else
      @chatroom = @chatroom.first
    end
    @my_items = []
    CatalogItem.where(user: current_user).each do |item|
      @my_items << [item.book.title, item.id]
    end
    @request = Request.new
  end

  def new
    @item = CatalogItem.new
    @results = []
    @results2 = []
    if params[:query].present?
      results = PgSearch.multisearch(params[:query])
      if results.length != 0
        results.each do |result|
          @results << [result.searchable.title, result.searchable.id]
          @results2 << result.searchable
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
          @results2 << new_book
          @results << [new_book.title, new_book.id]
        end
      end
    end
  end

  def destroy
    catalog_item = CatalogItem.find(params[:id])
    catalog_item.destroy
    redirect_to my_books_path
  end

  def make_unavailable
    item = CatalogItem.find(params[:id])
    item.available = false
    item.save
    redirect_to my_books_path
  end

  def make_available
    item = CatalogItem.find(params[:id])
    item.available = true
    item.save
    redirect_to my_books_path
  end

  def make_mint
    item = CatalogItem.find(params[:id])
    item.quality = "Mint"
    item.save
    redirect_to my_books_path
  end

  def make_near_mint
    item = CatalogItem.find(params[:id])
    item.quality = "Near-mint"
    item.save
    redirect_to my_books_path
  end

  def make_good
    item = CatalogItem.find(params[:id])
    item.quality = "Good"
    item.save
    redirect_to my_books_path
  end

  def make_worn
    item = CatalogItem.find(params[:id])
    item.quality = "Worn"
    item.save
    redirect_to my_books_path
  end

  def make_poor
    item = CatalogItem.find(params[:id])
    item.quality = "Poor"
    item.save
    redirect_to my_books_path
  end

  def my_books
    items = CatalogItem.where(user: current_user)
    @items = items.sort_by { |item| item.updated_at }
    @items.reverse!
  end

  def create
    @item = CatalogItem.new(catalog_item_params)
    if params[:catalog_item]
      @item.book = Book.find(params[:catalog_item][:book])
      @item.user = current_user
      @item.address = current_user.address
      if @item.save
        redirect_to my_books_path
      else
        @results = []
        render :new
      end
    else

    end
  end

  private

  def catalog_item_params
    params.require(:catalog_item).permit(:quality, :available)
  end
end
