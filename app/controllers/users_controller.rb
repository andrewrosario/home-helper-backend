class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def index 
       
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            @token = encode_token(user_id: @user.id)
            render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    def show
        @user = User.find(params[:id])
        render json: { user: @user.as_json(include: [:novice_projects, :expert_projects]) }
    end

    private
    def user_params
        params.permit(:name, :email, :password, :password_confirmation, :image)
    end
end
