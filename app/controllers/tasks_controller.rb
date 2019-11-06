class TasksController < ApplicationController
    def find_all_and_render
        @tasks = Task.all.where('project_id = ?', params[:task][:project_id]).order(:id)
        render json: @tasks
    end

    def create
        @task = Task.create(task_params)
        project_id = params[:project_id]
        find_all_and_render()
    end

    def update
        @task = Task.find(params[:id])
        @task.update(task_params)
        find_all_and_render()
    end

    def destroy
        @task = Task.find(params[:id])
        project_id = @task.project.id
        @task.destroy
        @tasks = Task.all.where('project_id = ?', project_id).order(:id)
        render json: @tasks
    end

    private

    def task_params
        params.require(:task).permit(:text, :time_required, :project_id, :is_complete)
    end
end
