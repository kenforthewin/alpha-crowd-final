class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!

  respond_to :html

  def index
    @topics = Topic.page(params[:page]).order('created_at DESC')
  end

  def show
    respond_with(@topic)
  end

  def new
    @topic = Topic.new
    respond_with(@topic)
  end

  def edit
  end

  def upvote
    if !current_user.liked? @topic
      @topic.vote_by :voter => current_user, vote: 'like'
    end
    redirect_to topics_path
  end

  def downvote
    if !current_user.disliked? @topic
      @topic.downvote_from current_user
    end

    redirect_to topics_path
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    @topic.save
    respond_with(@topic)
  end

  def update
    @topic.update(topic_params)
    respond_with(@topic)
  end

  def destroy
    @topic.destroy
    respond_with(@topic)
  end

  private
    def set_topic
      @topic = Topic.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:title, :text_field, :user_id)
    end
end
