class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show new create]

  def show
    @book_review = BookReview.new
    @item = CatalogItem.new
    @users = User.all.filter { |user| user != current_user }
    @book = Book.find(params[:id])
    @coffee_shops = []
    @book.catalog_items.each do |item|
      if Coffee.near([item.latitude, item.longitude], 15)
        @coffee_shops << [item, Coffee.near([item.latitude, item.longitude], 15)]
      end
    end
    @coffee_shops.filter! { |shop| shop[0].user != current_user }
    if params[:ci_id]
      @catalog_item = CatalogItem.find(params[:ci_id])
    end
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book has been added"
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :summary,
                                 :category, :rating)
  end
end
