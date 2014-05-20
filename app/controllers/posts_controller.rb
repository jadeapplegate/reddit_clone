class PostsController < ApplicationController

def index
    @posts = Post.all
      respond_to do |f|
        f.json { render :json => @posts, :only => [:id, :title, :author, :text]}
      end
    @user = current_user
end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to @post
  end

private
  def post_params
    params[:post].permit(:body, :title, :comments_attributes=>[:body])
  end


end
