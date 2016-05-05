class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.topic_id = params[:topic_id]
    if @post.save
      redirect_to topic_path(params[:topic_id])
      WelcomeMailer.welcome_email(current_user).deliver_later
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)
    if @post.save
      redirect_to topic_path(params[:topic_id])
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to topic_path(params[:topic_id])
  end

  private

  def post_params
    params.require(:post).permit!
  end
end
