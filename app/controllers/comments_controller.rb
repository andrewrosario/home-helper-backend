class CommentsController < ApplicationController

    def create
        @comment = Comment.create(comment_params)
        
        render json: @comment
    end

    private

    def comment_params
        params.require(:comment).permit(:task_id, :material_id, :resource_id, :text, :user_id)
    end
end
