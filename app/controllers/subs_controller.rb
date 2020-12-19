class SubsController < ApplicationController
    before_action :check_for_moderator, only: [:edit]

    def new
        @sub = current_user.subs.new
    end

    def create
        @sub = current_user.subs.new(sub_params)
        if @sub.save
            flash.now[:notice] = "Sub was successfully created"
            redirect_to @sub
        else
            flash.now[:error] = @sub.errors.full_messages
            render 'new'
        end
    end

    def index
    end

    def show
        @sub = Sub.find(params[:id])
    end

    def edit
        @sub = Sub.find(params[:id])
    end

    def update
        @sub = Sub.find(params[:id])
        if @sub.update(sub_params)
            flash.now[:notice] = "Sub was successfully updated"
            redirect_to @sub
        else
            flash.now[:error] = @sub.errors.full_messages
            render 'edit'
        end
    end

    def check_for_moderator
        current_user && Sub.find(params[:id]).moderator_id == current_user.id
    end

    def sub_params
        params.require(:sub).permit(:title, :description)
    end


end
