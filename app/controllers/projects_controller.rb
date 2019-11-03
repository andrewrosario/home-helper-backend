class ProjectsController < ApplicationController
    def create
        @project = Project.create(project_params)
        @user = User.find(@project.novice_id)
        render json: { user: @user.as_json(include: [:novice_projects, :expert_projects]) }
    end

    def show
        @project = Project.find(params[:id])
        render json: @project
        #  { project: @project.as_json(include: [:materials, :tasks, :resources, :chat_room]) }
    end

    private

    def project_params
        params.permit(:novice_id, :title, :description, :project_type_id, before_photos: [])
    end
end
