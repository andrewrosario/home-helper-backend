class Rating < ApplicationRecord
    belongs_to :novice, class_name: 'User'
    belongs_to :expert, class_name: 'User'
end
