class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :novice_projects, :expert_projects
end
