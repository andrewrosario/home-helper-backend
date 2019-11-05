class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :novice_projects, :expert_projects, :image

  def novice_projects
    return unless object.novice_projects
    ActiveModelSerializers::SerializableResource.new(object.novice_projects,  each_serializer: ProjectSerializer)
  end

  def image
    Rails.application.routes.url_helpers.rails_blob_path(object.image, only_path: true)
  end
end
