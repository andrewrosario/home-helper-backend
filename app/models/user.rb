class User < ApplicationRecord
    has_many :expert_projects, class_name: 'Project', foreign_key: :expert_id
    has_many :novice_projects, class_name: 'Project', foreign_key: :novice_id
    has_many :messages
    has_many :novice_ratings, class_name: 'Rating', foreign_key: :novice_id
    has_many :expert_ratings, class_name: 'Rating', foreign_key: :expert_id
    has_many :comments
    has_many :expert_ins
    has_many :project_types, through: :expert_ins
    has_one_attached :image
    has_secure_password
    validates :email, uniqueness: { case_sensitive: false }
    validates :name, presence: true

end
