class MessagesController < ApplicationController
    def create
        new_message = Message.create(message_params)
        user = User.find(params[:user_id])
        new_message.user = user
        render json: new_message
    end

    def message_params
        params.require(:message).permit(:text, :user_id, :chat_room_id)
    end
end
