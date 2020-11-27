class ReviewsController < ApplicationController
    def index
        @reviews = @story.reviews.order(created_at: :desc) 
        render json: @reviews   
    end 

    def show 
        @review = Review.find(review_params)
        render json: @review, status: 200 
    end 

    def create
        @review = @story.reviews.new(review_params)
        @review.user = current_user
    
        render json: { errors: @review.errors }, status: :unprocessable_entity unless @review.save
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

    def find_story!
        @story = Story.find_by(id: params[:id])
    end

    def review_params 
        params.require(:review).permit(:content, :rating, :story_id, :user_id)
    end 
end
