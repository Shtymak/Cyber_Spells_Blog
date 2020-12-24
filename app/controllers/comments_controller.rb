class CommentsController < ApplicationController
    before_action :authenticate_user!
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
    user_comment
    post
   if @comment.destroy
    redirect_to post_path(post)

   else
    redirect_back(fallback_location: post_path(post))
   end
end
    private 
def user_comment
    redirect_back(fallback_location: posts_path)
    unless @comment = current_user.comments.find_by(id: params[:id])
    end
end
    def post
        @post ||= Post.find(params[:post_id])
    end

    def comment_params
        params.require(:comment).permit(:user_id, :body, :post_id) 
    end
end

