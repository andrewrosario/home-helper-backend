class Comment < ApplicationRecord
    belongs_to :resource, optional: true
    belongs_to :material, optional: true
    belongs_to :task, optional: true
    belongs_to :user
end
