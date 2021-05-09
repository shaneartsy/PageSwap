class BooksController < ApplicationController
  def new
    @book = Book.new
    authorize @book
  end

  def create
    @book = Book.new(book_params)
    authorize @book
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
