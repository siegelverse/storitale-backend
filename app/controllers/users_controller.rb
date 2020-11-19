class UsersController < ApplicationController
    def index
        @users = User.all 
        render json: @users   
    end 

    def show 
        @user = User.find(user_params)
        render json: @user, status: 200 
    end 

    def create
        @user = User.create(user_params)
        render json: @user
    end 

    def update 
    end 

    private 

    def user_params 
        params.require(:user).permit(:username, :email, :password_digest)
    end 
end
