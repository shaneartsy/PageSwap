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
  end
end

