class CommentsController < ApplicationController
    def create
        params[:comment][:post_id] = params[:post_id]
comment = Comment.create(comment_params) 
redirect_to post_path(comment.post_id)+ '#comments'
    end

    private 
    def comment_params
        params.require(:comment).permit(:user_name, :body, :post_id) 
    end
end
