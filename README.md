# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
class AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        user = User.find_by(username: user_login_params[:auth][:username])
        if user && user.authenticate(user_login_params[:auth][:password])
            token = issue_token(user)
            render json: {user: UsersSerializer.new(user), token: token}
        else
            render json: {error: 'That user could not be found'}, status: 401
        end
    end

    def show
       user = User.find_by(id: user_id)
       if logged_in?
           render json: user
       else
           render json: { error: 'No user could be found'}, status: 401
       end
    end

   private

    def user_login_params
        params.require(:user).permit(:username, :email, :password)
    end
end
