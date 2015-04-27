class ForumTopicsController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  def index 
    @forum = Forum.find_by_id(params[:forum_id])
    @sticky_threads = @forum.forum_topics.sticky_threads.order('updated_at ASC')
    @nonsticky_threads = @forum.forum_topics.nonsticky_threads.page(params[:page]).order('updated_at DESC')
    @forum_list = true
  end

  def new
    @forum_list = true
    @forum_topic = ForumTopic.new
    @user = current_user
    @forum = Forum.find_by_id(params[:forum_id])

    if @user.nil? or @forum.nil?
      return redirect_to root_path
    end

  end

  def create
    @forum_topic = ForumTopic.new
    @forum_topic.name = params[:thread][:name]
    @forum_topic.forum_id = params[:thread][:forum_id]
    @forum_topic.sticky = false
    @forum_topic.user = current_user
    @forum_topic.save!

    @post = Post.new
    @post.text = params[:thread][:post]
    @post.forum = @forum_topic.forum
    @post.forum_topic = @forum_topic
    @post.user = @forum_topic.user
    @post.save

    forum = @forum_topic.forum
    forum.update(updated_at: DateTime.current)

    redirect_to thread_path(@forum_topic.id)
  end

  private
    def set_forum_topic
      @forum_topic = ForumTopic.find(params[:id])
    end

    def forum_topic_params
      params.require(:forum_topic).permit(:forum_id, :name, :user_id)
    end
end
