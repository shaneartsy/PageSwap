class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about_us, :faq]

  def home
    @users = User.all
  end

  def about_us
  end

  def faq
  end

  def new
    @user_reviews = UserReview.new

  end
end
