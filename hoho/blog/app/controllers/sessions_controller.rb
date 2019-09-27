class SessionsController < ApplicationController

	# GET /login
	def new
		@auth_hash = request.env['omniauth.auth']
	end

	# POST /sessions
	def create
		user = User.find_or_create_from_auth_hash(@auth_hash)

    	user = User.find_by_email(params[:email])
    	if user && user.authenticate(params[:password])
    		session[:user_id] = user.id
    		redirect_to home_path
    	else
      		redirect_to login_path, alert: "Invalid email or password"
    	end
	end

	# DELETE /logout
	def destroy
    	session[:user_id] = nil
    	redirect_to home_path
	end

end