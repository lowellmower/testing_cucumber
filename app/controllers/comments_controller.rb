class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    if @comment.save
      redirect_to @post
    else
      flash[:notice] = "can't be blank"
      render "posts/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :body)
  end

end
