class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy, :show]
  before_action :only_signed_in_user, only: [:index]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /signup
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    if current_user.id == @user.id 
      respond_to do |format|
        format.html
        format.js
      end
    else
       redirect_to posts_path
    end
  end

  # POST /users
  def create
    @user = User.new(user_params)
      if @user.save
        UserMailer.registration_confirmation(@user).deliver
        redirect_to login_path, notice: 'User was successfully created.' 
        
      else
       render :new
      end
    end
 

	# PATCH/PUT /users/1
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else

        format.js {render partial: "error.js.erb"}
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to logout_path}
      format.json { head :no_content }
    end
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
     
      redirect_to login_path
    else
      redirect_to root_url
    end
end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
	params.require(:user).permit(:login, :email, :password, :password_confirmation, 
		:image, :image_cache, :remove_image, :remote_image_url)
  end
end
