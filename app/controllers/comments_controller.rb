class CommentsController < ApplicationController
  def index
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(params.require(:comment).permit(:body))
    @post.comments << @comment

    if @post
      flash[:notice] = "Comment was saved."
    else
      flash[:error] = "Comment was not saved."
    end
    redirect_to [@post.topic, @post]
  end
end
