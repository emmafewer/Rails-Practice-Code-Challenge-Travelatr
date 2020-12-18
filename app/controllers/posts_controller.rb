class PostsController < ApplicationController

    def like
        @post = Post.find(params[:id])
        @post.increment!(:likes)
        redirect_to @post
    end

    def show
        @post = Post.find(params[:id])
    end 

    def new
        @post = Post.new
        @bloggers = Blogger.all
        @destinations = Destination.all
    end 

    def edit 
        @post = Post.find(params[:id])
        @bloggers = Blogger.all
        @destinations = Destination.all
    end 

    def create 
        @post = Post.create(post_params)
        if @post.valid?
            redirect_to @post
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to new_post_path
        end
    end 

    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        if @post.valid?
            redirect_to @post
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to edit_post_path
        end
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end
end  