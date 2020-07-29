class Api::AuthController < ApplicationController
    skip_before_action :logged_in?

    def create 
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            render json: {user: user, username: user.username, token: encode_token({user_id: user.id})}
            # render json: {user: user, name: user.name, username: user.username, userId: user.id, token: encode_token({user_id: user.id})}
        else 
            render json: {error: "Invalid username or password"}
        end
    end
end
