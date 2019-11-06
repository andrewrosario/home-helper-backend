class ProjectsController < ApplicationController
    def create
        @project = Project.create(project_params)
        @@chat_room = ChatRoom.create(project_id: @project.id)
        @user = User.find(@project.novice_id)
        render json: @user
    end

    def show
        @project = Project.find(params[:id])
        render json: @project
    end

    def update
        @project = Project.find(params[:id])
        if @project.expert_status === 'accepted' || @project.expert_status === 'pending'
            @project.expert_id = nil
            @project.expert_status = 'none'
            @project.save
        else
            @project.expert = User.find(params[:expert_id])
            @project.expert_status = params[:expert_status]
            @project.save
        end
        render json: @project
    end

    private

    def project_params
        params.permit(:novice_id, :expert_status, :title, :description, :project_type_id, before_photos: [])
    end
end
