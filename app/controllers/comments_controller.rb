class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :user_comment, only: [:destroy]
    def create
        params[:comment][:user_id] = current_user.id
        comment = post.comments.build(comment_params) 
        if comment.save
            redirect_to post_path(comment.post_id)+ '#comments_'+comment.id.to_s
        else 
            pp 'comment error'
        end
    end


def destroy
    @post = @comment.post
    if @comment.destroy
        redirect_to post_path(post)
        pp 'deleted'
   else
        redirect_back(fallback_location: post_path(post))
        pp 'not deleted'
   end
end


    private 
    def comment
        @comment ||= Comment.find(params[:comment_id])
      end

def user_comment
    redirect_back(fallback_location: posts_path) unless @comment = current_user.comments.find_by(id: params[:id])
    
end
    def post
        @post ||= Post.find(params[:post_id])
    end

    def comment_params
        params.require(:comment).permit(:user_id, :body, :post_id, :comment_id) 
    end
end

