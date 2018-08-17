class PostsController < ApplicationController
    
    before_action :set_post, only: [ :show, :edit, :update, :destroy ]
    
    def index
        @posts = Post.all
    end
    
    def show
    end
    
    def new
        @post = Post.new
    end
    
    def create
#        if check_nil
#            render :new
#        end
        @post = Post.new(post_params)
        if @post.save
            redirect_to @post, notice: 'Post has been created'
        else
            render :new
        end
    end
    
    def edit
    end
    
    def update
        if @post.update(post_params)
            redirect_to @post
        else
            render :edit
        end
    end
    
    def destroy
        @post.destroy
        redirect_to posts_path, notice: 'Post has been deleted'
    end
    
    private 
    
    def set_post
        @post = Post.find(params[:id])
    end
    
    def post_params
        params.require(:post).permit(:title, :summary, :body)
    end
    
    def check_nil
        params[:title].nil?
    end
    
end
