class AuthController < ApplicationController
    skip_before_action :authorized
    def create 
        user = User.find_by(username: user_login_params[:username])
        if (user && user.authenticate(user_login_params[:password])) 
            token = encode_token({id: user.id})
            # byebug
            render json: {user: user, token: token}
        else 
            render json: {error: true, message: "invalid credintials"}
        end 
    end 

    private 

    def user_login_params 
        # byebug
        params.require(:user).permit(:id, :username, :password, :email, :bio, :image)
    end 
end
