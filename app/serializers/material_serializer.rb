class MaterialSerializer < ActiveModel::Serializer
  attributes :id, :name, :link, :cost, :amount, :amount_unit, :comments

  def comments
    ActiveModelSerializers::SerializableResource.new(object.comments,  each_serializer: CommentSerializer)
  end
end