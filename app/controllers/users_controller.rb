class UsersController < ApplicationController
    
    def index
        users = User.all 
        render json: users   
    end 

    # def profile
    #     user = User.find(params[:id])
    #     render json: {user: current_user}
    # end

    def create
        user = User.create!({username: params[:username], email: params[:email], password: params[:password]})  
        if user.valid?
            # user.save
            token = JWT.encode({id: user.id}, "let's tell a story")
            render json: { user: user, token: token }
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end 

    def show 
        user = User.find(user_params)
        render json: user, status: 200 
    end 

    def login
        user = User.find_by(username: params[:username])
        if (user && user.authenticate(params[:password])) 
            token = JWT.encode({id: user.id}, "let's tell a story")
            # byebug
            render json: {user: user, token: token}
        else 
            render json: {error: true, message: "invalid credintials"}
        end 
    end 

    # def get_user 
    #     user = self.current_user
    #     render json: user
    # end 

    def update 
    end 

    private 

    def user_params 
        # byebug
        params.require(:user).permit(:username, :password, :email)
    end 
end
