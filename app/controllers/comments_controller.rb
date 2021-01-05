class CommentsController < ApplicationController

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        @comment.author_id = current_user.id

        if @comment.save
            flash.now[:notice] = 'Comment created'
            redirect_to post_path(@comment.post_id)
        else
            raise error
        end
    end

    def comment_params
        params.permit(:body, :post_id, :author_id)
    end
end
