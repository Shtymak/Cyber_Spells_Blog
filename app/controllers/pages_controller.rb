class PagesController < ApplicationController
  def index
    @posts = Post.all.with_attached_images
  end
end
