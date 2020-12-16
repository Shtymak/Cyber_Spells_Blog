class PostsController < ApplicationController
    def index
    end
  
    def show
      @post =Post.find(params[:id])
     end
  
    def new
  
    end
  
    def create
      @post = Post.create(post_params)
      @post.save
      redirect_to @post
    end
  
    def edit; end
  
    private 
    def post_params
      params.require(:post).permit(:title, :body)
    end
  
end
