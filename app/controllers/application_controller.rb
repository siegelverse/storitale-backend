class ApplicationController < ActionController::API

      def render_error_response(error)
         render json: {failed: true, message: error}
      end 

      # def current_user
      #    begin
      #       method, token = request.headers[:Authorization].split(' ')
      #       if method === "Bearer"
      #          payload, header = JWT.decode(token, "let's tell a story")
      #          user.find(payload["id"])
      #       end 
      #    rescue 
      #       raise Exception.new("you must be logged in to make this request")
      #    end 
      # end
end
