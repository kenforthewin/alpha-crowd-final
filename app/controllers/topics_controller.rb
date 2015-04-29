class TopicsController < ApplicationController
  before_action :set_topic, only: [:upvote, :downvote]
  before_action :authenticate_user!

  respond_to :html

  def index
    @topics = Topic.page(params[:page]).order('created_at DESC')
  end

  def new
    @topic = Topic.new
    respond_with(@topic)
  end

  def upvote
    if !current_user.liked? @topic
      @topic.vote_by :voter => current_user, vote: 'like'
      if @topic.user != current_user
        @topic.user.vote_by :voter => current_user, vote: 'like'
      end
    end
    flash[:notice] = 'Thanks for voting. Feel free to participate in this topic\'s forum.'
    redirect_to show_forum_path(@topic.forum)
  end

  def downvote
    if !current_user.disliked? @topic
      @topic.downvote_from current_user
      if @topic.user != current_user
        @topic.user.downvote_from current_user
      end
    end
    flash[:notice] = 'Thanks for voting. Feel free to participate in this topic\'s forum.'
    redirect_to show_forum_path(@topic.forum)
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    @topic.save
    @topic.vote_by :voter => current_user, vote: 'like'

    forum = Forum.new
    forum.name = @topic.title
    forum.description = @topic.text_field
    forum.topic_id = @topic.id
    forum.save

    pro_thread = ForumTopic.new
    pro_thread.user = current_user
    pro_thread.sticky = true
    pro_thread.forum = forum
    pro_thread.name = 'Pros'
    pro_thread.save

    con_thread = ForumTopic.new
    con_thread.user = current_user
    con_thread.sticky = true
    con_thread.forum = forum
    con_thread.name = "Cons"
    con_thread.save

    redirect_to show_forum_path(forum)
  end

  private
    def set_topic
      @topic = Topic.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:title, :text_field, :user_id)
    end
end
