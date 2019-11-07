class TaskSerializer < ActiveModel::Serializer
  attributes :id, :text, :time_required, :is_complete, :comments

  def comments
    ActiveModelSerializers::SerializableResource.new(object.comments,  each_serializer: CommentSerializer)
  end
end
