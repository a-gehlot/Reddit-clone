class CommentsController < ApplicationController

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.build(comment_params)

        if @comment.save!
            flash.now[:notice] = 'Comment created'
            redirect_to post_path(@comment.post_id)
        else
            flash.now[:error] = @comment.errors.full_messages
            redirect_to post_path(params[:post_id])
        end
    end

    def show
        @comment = Comment.find(params[:id])
    end

    def comment_params
        params.permit(:body, :post_id, :author_id, :parent_comment_id)
    end
end
