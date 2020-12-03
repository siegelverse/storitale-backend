class ReviewsController < ApplicationController
    before_action :find_story
    skip_before_action :authorized
    def index
        @reviews = find_story.reviews.order(created_at: :desc) 
        render json: @reviews   
    end 

    def show 
        @review = Review.find(review_params)
        render json: @review, status: 200 
    end 

    def create
        @review = find_story.reviews.create(review_params)
        # @review.user = current_user
        redirect_to action: "index"
    end 

    def update 
    end 

    def destroy
        @review = @story.reviews.find(params[:id])
    
        if @review.user_id == @current_user_id
          @review.destroy
          render json: {}
        else
          render json: { errors: { review: ['not owned by user'] } }, status: :forbidden
        end
    end

    private 

    def find_story
        # byebug
        @story = Story.find_by(id: params[:story_id])
    end

    def review_params 
        params.require(:review).permit(:content, :rating, :story_id, :user_id)
    end 
end
