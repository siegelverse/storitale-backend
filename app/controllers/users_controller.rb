class UsersController < ApplicationController
    skip_before_action :authorized
    # , only: [:create, :login]
    
    def index
        users = User.all 
        render json: users   
    end 

    # def profile
    #     user = User.find_by(id: params[:id])
    #     render json: {user: current_user}
    # end

    def create
        user = User.create!({id: params[:id], username: params[:username], email: params[:email], password: params[:password]})  
        if user.valid?
            # user.save
            token = encode_token({id: user.id})
            render json: { user: user, token: token }
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end 

    def show 
        user = User.find_by(id: params[:id])
        render json: user, status: 200 
    end 

    # def login
    #     # byebug
    #     user = User.find_by(username: user_params[:username])
    #     if (user && user.authenticate(user_params[:password])) 
    #         token = JWT.encode({id: user.id}, "let's tell a story")
    #         # byebug
    #         render json: {user: user, token: token}
    #     else 
    #         render json: {error: true, message: "invalid credintials"}
    #     end 
    # end 

    def get_user 
        user = self.current_user
        render json: user
    end 

    def update 
        user = User.find_by(id: params[:id])
        user.update(user_params)
        render json: user, status: 200 
    end 

    private 

    def user_params 
        # byebug
        params.require(:user).permit(:id, :username, :password, :email, :bio, :image)
    end 
end
