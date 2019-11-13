class CommentsController < ApplicationController

    def create
        @comment = Comment.create(comment_params)
        if @comment.task
            @tasks = Task.all.where('project_id = ?', comment.task.project.id).order(:id)
            render json: @tasks
        elsif @comment.material
            @materials = Material.all.where('project_id = ?', comment.task.project.id).order(:id)
            render json: @materials
        end
        render json: @comment
    end

    private

    def comment_params
        params.require(:comment).permit(:task_id, :material_id, :resource_id, :text, :user_id)
    end
end
