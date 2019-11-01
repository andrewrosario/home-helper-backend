class TasksController < ApplicationController

    def create
        @task = Task.create(task_params)
        project_id = params[:project_id]
        @tasks = Task.all.where('project_id = ?', params[:task][:project_id])

        render json: @tasks
    end

    private

    def task_params
        params.require(:task).permit(:text, :time_required, :project_id)
    end
end
