class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @book_review = BookReview.new
    @users = User.all.filter { |user| user != current_user}
    @book = Book.find(params[:id])
  end
end
