class Comment < ApplicationRecord
    belongs_to :resource
    belongs_to :material
    belongs_to :task
    belongs_to :user
end
