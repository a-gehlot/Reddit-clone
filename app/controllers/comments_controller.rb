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

    def upvote
        vote(1)
    end

    def downvote
        vote(-1)
    end

    private

    def comment_params
        params.permit(:body, :post_id, :author_id, :parent_comment_id)
    end

    def vote(direction)
        @comment = Comment.find(params[:id])
        @user_vote = @comment.votes.find_or_initialize_by(user_id: current_user.id)

        @user_vote.update(value: direction)

        redirect_back(fallback_location: subs_path)
    end
end
