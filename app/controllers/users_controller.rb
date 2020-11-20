class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]
    def index
        @users = User.all 
        render json: @users   
    end 

    def profile
        @user = User.find(params[:id])
        render json: {user: current_user}
    end

    def create
        @user = User.new(user_params)
        # byebug
        if @user.valid?
            @user.save
            @token = encode_token(@user)
            render json: { user: @user, jwt: @token }
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end 

    def show 
        @user = User.find(user_params)
        render json: @user, status: 200 
    end 


    def update 
    end 

    private 

    def user_params 
        # byebug
        params.require(:user).permit(:username, :email, :password_digest)
    end 
end
