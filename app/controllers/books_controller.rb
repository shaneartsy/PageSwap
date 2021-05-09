class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @book_review = BookReview.new
    @users = User.all.filter { |user| user != current_user}
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book has been added"
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author,
                                 :summary, :category,
                                 :rating)
  end
end
