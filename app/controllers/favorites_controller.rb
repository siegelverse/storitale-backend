class FavoritesController < ApplicationController
    before_action :find_story!
    skip_before_action :authorized
    # private
  
    def find_story!
        # byebug
        @story = Story.find_by(id: params[:story_id])
        @user = User.find_by(id: params[:user_id])
    end

    def create
        # byebug
        @story = Story.find_by(id: params[:story_id])
        @user = User.find_by(id: params[:user_id])
        @fav = Favorite.create(user_id: @user.id, story_id: @story.id)
        render json: @story.favorites
    end
    
    def destroy
        # current_user.unfavorite(@story) 
        @story = Story.find_by(id: params[:story_id])
        @user = User.find_by(id: params[:user_id])
        @fav = Favorite.find_by(user_id: @user.id, story_id: @story.id)
        @fav.delete
        render json: @story.favorites
    end
    private 

    def fav_params
        params.require(:favorite).permit(:id, :user_id, :story_id)
    end 
end