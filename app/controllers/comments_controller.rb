class CommentsController < ApplicationController
  def create
    comment = post.comments.build(comment_params)
    comment.user = current_user
    comment.save!

    redirect_to post
  end

  def destroy
    comment = current_user.comments.find(params[:id])
    comment.destroy

    redirect_to comment.post
  end

  private

  def post
    Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:name, :content)
  end
end
