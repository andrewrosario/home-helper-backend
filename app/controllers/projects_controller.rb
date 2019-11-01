class ProjectsController < ApplicationController
    def create
        puts params
        @project = Project.create(project_params)
        @user = User.find(@project.novice_id)
        render json: { user: @user.as_json(include: [:novice_projects, :expert_projects]) }

    end

    def show
        @project = Project.find(params[:id])
        render json: @project
    end

    private

    def project_params
        params.require(:project).permit(:novice_id, :title, :description, :project_type_id)
    end
end
