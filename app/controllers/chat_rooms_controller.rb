class ChatRoomsController < ApplicationController
    def show
        chat = ChatRoom.find(params[:id])
        render json: chat.as_json(include: :messages)
    end
end
