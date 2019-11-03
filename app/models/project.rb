class Project < ApplicationRecord
    belongs_to :project_type, optional: true
    belongs_to :novice, class_name: 'User', optional: true
    belongs_to :expert, class_name: 'User', optional: true
    has_many :resources
    has_many :materials
    has_many :tasks, -> { order "id ASC" }
    has_one :chat_room
    has_many_attached :before_photos
    has_many_attached :after_photos
end
