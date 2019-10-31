class ChatRoom < ApplicationRecord
    belongs_to :project
    has_many :messages
end
