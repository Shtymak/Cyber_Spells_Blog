class RatingsController < ApplicationController
before_action :post

  def create
      @rating = @post.ratings.new :value => params[:value]
      if @rating.save
        pp "Rate successful"
        redirect_to @post, :notice => "Rating successful."
      else
        pp "Rate wrong"
        redirect_to @post, :notice => "Something went wrong."
      end
      pp @rating
    end

    def update
      @rating = Rating.find(params[:id])
      @rating.update_attribute :value, params[:value]

      pp 'Rating here'
      redirect_to post_path(post)
    end

    private

    def post
        @post = Post.find(params[:post_id])
    end

end
