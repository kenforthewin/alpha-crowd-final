class ForumTopicsController < ApplicationController
  before_action :set_forum_topic, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @forum_topics = ForumTopic.all
    respond_with(@forum_topics)
  end

  def show
    respond_with(@forum_topic)
  end

  def new
    @forum_topic = ForumTopic.new
    respond_with(@forum_topic)
  end

  def edit
  end

  def create
    @forum_topic = ForumTopic.new(forum_topic_params)
    @forum_topic.save
    respond_with(@forum_topic)
  end

  def update
    @forum_topic.update(forum_topic_params)
    respond_with(@forum_topic)
  end

  def destroy
    @forum_topic.destroy
    respond_with(@forum_topic)
  end

  private
    def set_forum_topic
      @forum_topic = ForumTopic.find(params[:id])
    end

    def forum_topic_params
      params.require(:forum_topic).permit(:forum_id, :name, :user_id)
    end
end
