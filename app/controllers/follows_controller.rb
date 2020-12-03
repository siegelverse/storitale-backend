class FollowsController < ApplicationController
    skip_before_action :authorized
    def show
        @follower = User.find_by(id: params[:user_id])

        render json: @follower.follows
    end 

    def create
        @follower = User.find_by(id: params[:follower_id])
        @user = User.find_by(id: params[:followable_id])
        if @follower.id != @user.id 
            Follow.create(follower_id: @follower.id, followable_id: @user.id, follower_type: "User", followable_type: "User")
        else 
            render json: {message: "you can't follow yourself!"}
        end 
        render json: @follower.follows
    end

    def destroy
        # byebug
        @follower = User.find_by(id: params[:user_id])
        # @user = User.find_by(id: params[:followable_id])
        @follow = Follow.find_by(id: params[:followable_id])
        @follow.delete
    
        render json: @follower.follows
    end
end