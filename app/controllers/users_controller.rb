class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts.with_attached_image
  end
end
