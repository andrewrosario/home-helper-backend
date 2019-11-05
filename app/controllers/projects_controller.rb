class ProjectsController < ApplicationController
    def create
        @project = Project.create(project_params)
        @@chat_room = ChatRoom.create(project_id: @project.id)
        @user = User.find(@project.novice_id)
        render json: @user
        # { user: @user.as_json(include: [ {:novice_projects, :expert_projects }]) }
    end

    def show
        @project = Project.find(params[:id])
        render json: @project
    end

    def update
        @project = Project.find(params[:id])
        if @project.expert
            @project.expert_id = nil
            @project.save
        else
            @project.expert = User.find(params[:expert_id])
            @project.save
        end
        render json: @project
    end

    private

    def project_params
        params.permit(:novice_id, :title, :description, :project_type_id, before_photos: [])
    end
end
