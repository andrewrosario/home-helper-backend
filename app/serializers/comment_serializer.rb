class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :created_at, :user_name

  def user_name
    object.user.name
  end
end
