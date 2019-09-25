class PostsController < ApplicationController
    before_action :only_signed_in_user, only: [:edit, :new, :destroy, :update]
    before_action :set_post, only: [ :show, :edit, :update, :destroy ]

    # GET /posts
    def index
        @post = Post.all
    end

    # GET /posts/new
    def new
        @post = current_user.posts.build
        @document = @post.documents.build
    end

    # GET /posts/1
    def show

    end 

    # GET /posts/1/edit
    def edit
        if current_user && current_user.id == @post.user_id 
            
        else
            redirect_to posts_path
        end
    end 

    # PATCH/PUT /posts/1
    def update
        respond_to do |format|
            if @post.update(post_params)
              format.html { redirect_to @post}
            else
              format.js {}
            end
          end
    end 

    # DELETE /posts/1
    def destroy
        @post.destroy
        redirect_to posts_path
    end

    # POST /posts
    def create
        @post = current_user.posts.new(post_params)

        if(@post.save)
            if params[:documents]
                params[:documents].each do |document|
                  @post.documents.create(path: document, documentable_id: @post.id, documentable_type: "Post")
                  p document
                  p @post.id
                end
            end
             redirect_to @post
        else
            render 'new'
        end
    end
     
    private 
    def set_post
        @post = Post.find(params[:id])
    end
    
    def post_params
        params.require(:post).permit(:title, :body, documents_attributes: [:document, :post_id])
    end

end