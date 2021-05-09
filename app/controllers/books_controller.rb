class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  def show
    @users = User.all.filter { |user| user != current_user}
    @book = Book.find(params[:id])
  end
end
