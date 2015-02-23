class CommentsController < ApplicationController
  def index
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(params.require(:comment).permit(:body))
    @post.comments << @comment
    @topic = @post.topic

    if @post
      flash[:notice] = "Comment was saved."
    else
      flash[:error] = "Comment was not saved."
    end
    redirect_to [@post.topic, @post]
  end

  def destroy
     # @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:post_id])
     @comment = @post.comments.find(params[:id])
      @topic = @post.topic
 
     authorize @comment
     if @comment.destroy
       flash[:notice] = "Comment was removed."
       redirect_to [@topic, @post]
     else
       flash[:error] = "Comment couldn't be deleted. Try again."
       redirect_to [@topic, @post]
     end
   end
end
