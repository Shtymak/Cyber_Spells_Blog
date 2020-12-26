class PostsController < ApplicationController
    before_action :authenticate_user!, except: %i[index show]
    #before_action :post
    before_action :user_post, only: %i[edit update destroy]

    def index
        @posts = Post.all
    end

    def show
        @comments = post.comments
        post.update(views: post.views+1)
     end

    def new

    end

    def update
        post.update(post_params)
        redirect_to post
    end

    def destroy
        post.destroy
        redirect_to posts_path
    end

    def edit
        post
    end

    def create
        post = current_user.posts.build(post_params)
        #params[:post][:user_id] = current_user.id
        #post = Post.new(post_params)
        post.username = current_user.email
        post.views = 1
       if post.save
            redirect_to post
       else
        pp 'Create error'
       end
    end


    private
    def user_post
        redirect_back(fallback_location: posts_path) unless @post = current_user.posts.find_by(id: params[:id])
    end


    def post
         @post ||= Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit( :views, :user_id, :title, :category_id, :body, :image, images: [])
    end

end
