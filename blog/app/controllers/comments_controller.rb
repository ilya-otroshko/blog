class CommentsController < ApplicationController
    before_action :find_commentable
    before_action :set_comment, only: [:edit, :update, :destroy ]

        def new
          @comment = Comment.new
        end
    
		def create
			# current_user.comments.create(commentable_type: 'Post/Comment', commentable_id: 'id', body: 'qwe')

      @comment = @commentable.comments.new(comment_params)
      @comment.user_id = current_user
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
          params.require(:comment).permit(:body, :commentable_id, :commentable_type)
        end
        def set_comment
          @comment = Comment.find(params[:id])
      	end
        def find_commentable
          @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
          @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
        end
    
    end