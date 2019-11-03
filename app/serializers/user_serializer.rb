class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :novice_projects, :expert_projects, :image

  def image
    Rails.application.routes.url_helpers.rails_blob_path(object.image, only_path: true)
  end
end
