class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about_us, :faq]

  def home
    @users = User.all
  end

  def user_page
    @user = User.find(params[:user_id])
    @items = @user.catalog_items
  end

  def about_us
  end

  def faq
  end
end
