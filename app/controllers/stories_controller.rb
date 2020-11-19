class StoriesController < ApplicationController
    def index
        @stories = Story.all 
        render json: @stories   
    end 

    def show 
        @story = Story.find(story_params)
        render json: @story, status: 200 
    end 

    def create
        @story = Story.create(story_params)
        render json: @story
    end 

    def update 
    end 

    private 

    def story_params 
        params.require(:story).permit(:title, :body, :location, :genre_id, :user_id)
    end 
end
