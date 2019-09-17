class CommentsController < ApplicationController
    before_action :find_commentable
    before_action :only_signed_in_user, only: [:edit, :new, :destroy, :update]
    before_action :set_comment, only: [:edit, :update, :destroy ]

        def new
            @comment = Comment.new
        end
    
        def create
      @comment = current_user.comments.new(comment_params)
      
      @commentable = comment_params[:commentable_id]
      
      respond_to do |format|
          if @comment.save
            format.html {redirect_to posts_path, notice: 'Your comment was successfully posted!'}
            format.js
          else
            format.js {render partial: "error.js.erb"}
          end
        end
    end
		
        def update 
          if current_user && current_user.id == @comment.user_id 
            if (@comment.update(body: params[:body]))
            else
                render partial: "error.js.erb"
            end
          else  
            render partial: "error.js.erb"
          end
		end

	def destroy
      @comment.destroy
      render json: {success: true}
	end
		
        def show
          redirect_to posts_path(@commentable)
        end
    
        private
    
        def comment_params
          params.require(:comment).permit(:body,:commentable_id, :commentable_type, :image, :image_cache, :remove_image, :remote_image_url)
        end
        def set_comment
          @comment = Comment.find(params[:id])
      	end
        def find_commentable
          @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
          @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
        end
    
    end