class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :before_photos, :materials, :tasks, :resources, :chat_room, :title, :description, :expert, :project_type_id, :novice, :expert_status, :is_complete, :complete_tasks

  def before_photos
    return unless object.before_photos.attachments
    image_urls = object.before_photos.map do |image| 
        Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true)
    end
    image_urls
  end

  def complete_tasks
    object.tasks.count {|task| task.is_complete}
  end

  def expert
    if object.expert
      ExpertSerializer.new(object.expert)
    end
  end

  def novice
    ExpertSerializer.new(object.novice)
  end

  def chat_room
    ActiveModelSerializers::SerializableResource.new(object.chat_room,  each_serializer: ChatRoomSerializer)
  end

  def tasks
    ActiveModelSerializers::SerializableResource.new(object.tasks,  each_serializer: TaskSerializer)
  end

  def materials
    ActiveModelSerializers::SerializableResource.new(object.materials,  each_serializer: MaterialSerializer)
  end
end
