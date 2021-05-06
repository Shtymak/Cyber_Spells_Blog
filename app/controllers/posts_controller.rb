class PostsController < ApplicationController
    before_action :authenticate_user!, except: %i[index show]
    #before_action :post
    before_action :user_post, only: %i[edit update destroy]

    def index
        @posts = Post.all.includes(:likes).with_attached_image
    end

    def show
        @comments = post.comments
        @rating = Rating.find_or_initialize_by(user: current_user, post: post)
        @rating.value = params[:value]
        pp params[:value]
        # unless @rating.save
        #     @rating.update_attribute :value
        # end
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
        post.views = 0
       if post.save
            redirect_to post
       else
        pp 'Create error'
       end
    end


    def search
      search = params[:search].downcase
      @posts = Post.where("lower(title) LIKE '%#{search}%'OR lower(body) LIKE'%#{search}%'")
    end

    private
    def user_post
        redirect_back(fallback_location: posts_path) unless @post = current_user.posts.find_by(id: params[:id])
    end


    def post
         @post ||= Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit( :views, :user_id, :title, :category_id,:body, :image, images: [])
    end

end
