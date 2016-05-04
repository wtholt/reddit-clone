class TopicsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = Post.where(topic_id: @topic.id)
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def create
    @topic = current_user.topics.build(topic_params)
    @topic.save
    if @topic.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.update_attributes(topic_params)
    if @topic.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to root_path
  end

  private

  def topic_params
    params.require(:topic).permit!
  end
end
