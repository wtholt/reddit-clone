class TopicsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
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

  private

  def topic_params
    params.require(:topic).permit!
  end
end
