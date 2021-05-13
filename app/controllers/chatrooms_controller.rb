class ChatroomsController < ApplicationController

  def index
    @chatrooms = Chatroom.all.filter { |room| room.user1 == current_user || room.user2 == current_user }
    @chatrooms = @chatrooms.uniq { |room| room.user1 || room.user2 }
  end

  def show_room
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def show_user_room
    @message = Message.new
    user = User.find(params[:user_id])
    chatroom = Chatroom.all.filter{ |room| (room.user1 == current_user && room.user2 == user) || (room.user2 == current_user && room.user1 == user) }
    if chatroom.length < 1
      @chatroom = Chatroom.create(user1: current_user, user2: user)
    else
      @chatroom = chatroom.first
    end
  end

  def show
    if params[:id].zero?
      @user = User.find(params[:user])
      @chatroom = Chatroom.where(user1: current_user, user2: @user) || Chatroom.where(user1: @user, user2: current_user)
    else
      @chatroom = Chatroom.find(params[:id])
    end
    @message = Message.new
  end
end
