class BookReviewsController < ApplicationController

  def create
    @book_review = BookReview.new(book_reviews_params)
    @book = Book.find(params[:book_id])
    @book_review.book = @book
    @book_review.user = current_user
    if @book_review.save
      redirect_to book_path(@book, anchor: "review-#{@book_review.id}")
    else
      @users = User.all.filter { |user| user != current_user}
      render "books/show"
    end
  end

  private

  def book_reviews_params
    params.require(:book_review).permit(:content, :rating)
  end
end
