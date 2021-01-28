class PostsController < ApplicationController
    before_action :check_for_author, only: [:edit, :update]

    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.new(post_params)
        if @post.save
            flash.now[:notice] = "Post was created"
            redirect_to post_path(@post)
        else
            flash.now[:error] = @post.errors.full_messages
            render 'new'
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            flash.now[:notice] = "Post has been updated"
            redirect_to @post
        else
            flash.now[:error] = @post.errors.full_messages
            render "edit"
        end
    end

    def destroy
        Post.find(params[:id]).destroy
    end

    def show
        @post = Post.find(params[:id])
        @all_comments = @post.comments.includes(:author)
    end

    def upvote
        vote(1)
    end

    def downvote
        vote(-1)
    end

    def check_for_author
        current_user && Post.find(params[:id]).author_id == current_user.id
    end

    private


    def post_params
        params.require(:post).permit(:title, :url, :content, sub_ids: [])
    end

    def vote(direction)
        @post = Post.find(params[:id])
        @user_vote = @post.votes.find_or_create_by(user_id: current_user.id, value: 0)

        @user_vote.update(value: direction)

        redirect_back(fallback_location: subs_path)
    end
end
