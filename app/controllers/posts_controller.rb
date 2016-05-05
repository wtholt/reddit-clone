class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.topic_id = params[:topic_id]
    if @post.save
      redirect_to topic_path(params[:topic_id])
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit!
  end
end
