class FollowsController < ApplicationController
    def create
        @user = User.find_by(username: params[:username])
    
        current_user.follow(@user) if current_user.id != @user.id
    
        render json: @user
    end

    def destroy
        @user = User.find_by(username: params[:username])
    
        current_user.stop_following(@user) if current_user.id != @user.id
    
        render json: @user
    end
end