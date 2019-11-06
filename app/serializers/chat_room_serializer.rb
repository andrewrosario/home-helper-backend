class ChatRoomSerializer < ActiveModel::Serializer
  attributes :id, :messages

  def messages
    @messages = object.messages
  end
end
