class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def destroy
    post = current_user.posts.find(params[:id])

    if post.destroy
      redirect_to :root, notice: "Post was deleted"
    else
      redirect_to post, flash: { error: "Post could not be deleted" }
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params
      .require(:post)
      .permit(:title, :content)
  end
end
