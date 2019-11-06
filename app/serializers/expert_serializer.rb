class ExpertSerializer < ActiveModel::Serializer
  attributes :id, :name, :image

  def image
    Rails.application.routes.url_helpers.rails_blob_path(object.image, only_path: true)
  end
end
