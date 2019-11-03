class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :before_photos, :materials, :tasks, :resources, :chat_room, :title, :description

  def before_photos
    return unless object.before_photos.attachments
    image_urls = object.before_photos.map do |image| 
        Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true)
    end
    image_urls
  end
end
