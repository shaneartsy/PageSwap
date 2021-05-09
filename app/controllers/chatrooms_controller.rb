class ChatroomsController < ApplicationController

  def index
    @chatrooms = Chatroom.all.filter { |room| room.user1 == current_user || room.user2 == current_user }
    @chatrooms = @chatrooms.uniq { |room| room.user1 || room.user2 }
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
