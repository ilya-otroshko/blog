class LikesController < ApplicationController
    before_action :find_liketable
  before_action :set_like, only: [:show, :edit, :update, :destroy]
  before_action :only_signed_in_user, only: [:edit, :new, :destroy, :update]
  def new
    @like = Like.new
  end

  def create
    @like = current_user.likes.new(like_params)

    respond_to do |format|
      if @like.save
        format.js
      else
        format.js
      end
    end
  end

 
  def destroy

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
      params.require(:like).permit(:count, :liketable_id, :liketable_type, :user_id)
    end
    def find_liketable
        @liketable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
        @liketable = Post.find_by_id(params[:post_id]) if params[:post_id]
      end
end
