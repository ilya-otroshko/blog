class PostsController < ApplicationController
    before_action :only_signed_in_user, only: [:edit, :new, :destroy, :update]
    before_action :set_post, only: [ :show, :edit, :update, :destroy ]

    def index
        @post = Post.all
    end

    def new
        @post = current_user.posts.build
    end

    def show

    end 
    
    def edit
         if current_user && current_user.id == @post.user_id 
            
         else
            redirect_to posts_path
         end
    end 

    def update

        if(@post.update_attributes(post_params))
            redirect_to @post
       else
           render :edit
       end
    end 

    def destroy
        @post.destroy
        redirect_to posts_path
    end

    def create
        @post = current_user.posts.new(post_params)

        if(@post.save)
             redirect_to @post
        else
            render 'new'
        end
    end
     
    private 
    def post_params
        params.require(:post).permit(:title, :body, :image, :image_cache, :remove_image, :remote_image_url)
    end

    def set_post
        @post = Post.find(params[:id])
    end
end