class FavoritesController < ApplicationController
    before_action :find_story!
  
    private
  
    def find_story!
      @story = Story.find_by(id: params[:id])
    end

    def create
        current_user.favorite(@story)
    
        render json: @story
    end
    
    def destroy
        current_user.unfavorite(@story)
    
        render json: @story
    end
end