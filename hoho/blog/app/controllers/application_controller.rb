class ApplicationController < ActionController::Base
    helper_method :current_user

    def only_signed_in_user
        unless current_user
          flash[:notice] = 'Please signup to edit or create post'
          redirect_to signup_path
        end
      end

    def current_user
        if session[:user_id]
            @current_user ||= User.find(session[:user_id])
        else
            @current_user = nil
        end
    end
 
end