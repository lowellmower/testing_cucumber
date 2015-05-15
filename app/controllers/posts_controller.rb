class PostsController < ApplicationController
  def index
    @posts = Post.order("created_at DESC").all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if
      @post.save
      redirect_to @post
    else
      flash[:notice] = "can't be blank"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
