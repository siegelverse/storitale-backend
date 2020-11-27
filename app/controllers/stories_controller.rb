class StoriesController < ApplicationController
    def index
        @stories = Story.all 
        @stories = @stories.tagged_with(params[:tag]) if params[:tag].present?
        @stories = @stories.favorited_by(params[:favorited]) if params[:favorited].present?
        @stories_count = @stories.count
        @stories = @stories.order(created_at: :desc).offset(params[:offset] || 0).limit(params[:limit] || 20)

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
        params.require(:story).permit(:title, :body, :user_id, tag_list: [])
    end 
end
