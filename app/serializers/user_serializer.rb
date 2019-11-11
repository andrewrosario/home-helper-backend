class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :expert_ins, :novice_projects, :expert_projects, :image, :jwt, :rating

  def rating
    my_ratings = Rating.where(expert_id: object.id).average(:rating)
    my_ratings.to_f
  end

  def jwt
    return unless instance_options[:jwt]
    instance_options[:jwt]
  end

  def novice_projects
    return unless object.novice_projects
    ActiveModelSerializers::SerializableResource.new(object.novice_projects,  each_serializer: ProjectSerializer)
  end

  def expert_projects
    return unless object.expert_projects
    ActiveModelSerializers::SerializableResource.new(object.expert_projects,  each_serializer: ProjectSerializer)
  end

  def image
    Rails.application.routes.url_helpers.rails_blob_path(object.image, only_path: true)
  end
end
