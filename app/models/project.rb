class Project < ApplicationRecord
    belongs_to :project_type
    belongs_to :novice, class_name: 'User'
    belongs_to :expert, class_name: 'User'
    has_many :resources
    has_many :materials
    has_many :tasks
    has_one :chat_room
    has_many_attached :before_pictures
    has_many_attached :after_pictures
end
