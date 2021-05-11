class CatalogItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @user = User.find(params[:user_id])
    @items = @user.catalog_items
    @chatroom = Chatroom.all.filter { |room| (room.user1 == current_user && room.user2 == @user) || (room.user2 == current_user && room.user1 == @user) }
    if @chatroom.empty?
      @chatroom = Chatroom.create(user1: @user, user2: current_user)
    else
      @chatroom = @chatroom.first
    end
  end
end

