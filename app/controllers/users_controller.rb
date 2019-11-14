class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def index 
       @users = User.joins(:expert_ins).where('project_type_id = ?', params[:project_type_id].to_i)
       render json: @users
    end

    def create
        @user = User.create(user_params)
        byebug
        if @user.valid?
            @token = encode_token(user_id: @user.id)
            render json: @user, jwt: @token 
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    private
    def user_params
        params.permit(:name, :email, :password, :password_confirmation, :image)
    end
end
