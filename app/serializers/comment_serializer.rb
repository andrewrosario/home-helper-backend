class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :created_at, :user_name, :task_id, :material_id, :resource_id

  def user_name
    object.user.name
  end
end
