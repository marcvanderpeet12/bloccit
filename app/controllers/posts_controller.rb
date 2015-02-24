 class PostsController < ApplicationController
   def index
     # @posts = Post.visible_to(current_user).where("posts.created_at > ?", 7.days.ago).paginate(page: params[:page], per_page: 10)
      # @topic = Topic.find(params[:topic_id])
     @posts = Post.all   
   end
 end