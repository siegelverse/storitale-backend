class GenresController < ApplicationController
    def index
        @genres = Genre.all 
        render json: @genres  
    end 

    def show 
        @genre = Genre.find(genre_params)
        render json: @genre, status: 200 
    end 

    def create
        @genre = Genre.create(genre_params)
        render json: @genre
    end 

    def update 
    end 

    private 

    def genre_params 
        params.require(:genre).permit(:label)
    end 
end
