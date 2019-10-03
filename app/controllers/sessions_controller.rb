class SessionsController < ApplicationController

	# GET /login
	def new
		
	end

	# POST /sessions
	def create
		user = User.find_or_create_from_auth_hash(auth_hash)
		unless user.nil?
		  session[:user_id] = user.id
		  redirect_to home_path
		else
		  user = User.find_by_email(params[:email])
		  if user && user.authenticate(params[:password])
			if user.email_confirmed
			session[:user_id] = user.id
			redirect_to home_path
				else
				redirect_to login_path, alert: "Confirm your email"
				end
		  else
			if user.nil?
			  user = User.new(email: params[:email])
			end
		  end
		end
	end

	# DELETE /logout
	def destroy
    	session[:user_id] = nil
    	redirect_to home_path
	end
	protected

  def auth_hash
    request.env['omniauth.auth']
  end

end