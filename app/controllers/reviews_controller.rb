class ReviewsController < ApplicationController
    def index
        @reviews = Review.all 
        render json: @reviews   
    end 

    def show 
        @review = Review.find(review_params)
        render json: @review, status: 200 
    end 

    def create
        @review = Review.create(review_params)
        render json: @review
    end 

    def update 
    end 

    private 

    def review_params 
        params.require(:review).permit(:content, :rating, :story_id, :user_id)
    end 
end
