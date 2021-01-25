class UpvoteController < ApplicationController
    def create
        @post = Post.find_by(id: params[:post_id])
        @post.votes.create(user_id: current_user.id, value: 1)

        redirect_to post_path(params[:post_id])
    end
end