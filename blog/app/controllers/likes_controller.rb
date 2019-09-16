class LikesController < ApplicationController
  before_action :find_liketable
  before_action :set_like, only: [:show, :edit, :update, :destroy]
  before_action :only_signed_in_user, only: [:edit, :new, :destroy, :update]
  def new
    @like = Like.new
  end

  def create
	
	@like = current_user.likes.new(like_params)
	@object = @like.liketable
    respond_to do |format|
	  if @like.save
		format.html 
		format.js 
      else
        format.js
      end
    end
  end

 
  def destroy
	@object = @like.liketable
    @like.destroy
    respond_to do |format|
      format.js
    end
  end

  private

    def set_like
      @like = Like.find(params[:id])
    end

    def like_params
     params.fetch(:like, {}).permit(:count, :liketable_id, :liketable_type)
    end
    def find_liketable
		@liketable = Comment.find_by_id(like_params[:liketable_id]) if like_params[:liketable_type ]
        @liketable = Post.find_by_id(like_params[:liketable_id]) if like_params[:liketable_type ]
      end
end
