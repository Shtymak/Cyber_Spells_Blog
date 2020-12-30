class LikesController < ApplicationController
    before_action :post
    before_action :find_like, only: [:destroy]
    before_action :authenticate_user!
  def create
        if already_liked?
        flash[:notice] = "You can't like more than once"
      else
        @post.likes.create(user_id: current_user.id)
        redirect_back(fallback_location:home_path)
      end
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_to post_path(@post)
  end
  def index
    @likes = Like.joins(:responses).
      select("likes.*", 'COUNT("responses.id") AS responses_count').
      group('likes.id')
  end

  private

  def post
    @post = Post.find(params[:post_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end

  def find_like
    @like = @post.likes.find(params[:id])
 end
end
