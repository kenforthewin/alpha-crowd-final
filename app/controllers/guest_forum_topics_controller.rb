class GuestForumTopicsController < ApplicationController
  respond_to :html

  def index
    @guest_forum = GuestForum.find_by_id(params[:guest_forum_id])
    @sticky_threads = @guest_forum.guest_forum_topics.sticky_threads.order('updated_at ASC')
    @nonsticky_threads = @guest_forum.guest_forum_topics.nonsticky_threads.page(params[:page]).order('updated_at DESC')
    @forum_list = true
  end

  def new
    @forum_list = true
    @guest_forum_topic = GuestForumTopic.new
    @guest_user = current_guest_user
    @guest_forum = GuestForum.find_by_id(params[:guest_forum_id])

    if @guest_user.nil? or @guest_forum.nil?
      return redirect_to root_path
    end

  end

  def create
    @guest_forum_topic = GuestForumTopic.new
    @guest_forum_topic.name = params[:thread][:name]
    @guest_forum_topic.guest_forum_id = params[:thread][:guest_forum_id]
    @guest_forum_topic.sticky = false
    @guest_forum_topic.guest_user = current_guest_user
    @guest_forum_topic.save!

    @guest_post = GuestPost.new
    @guest_post.text = params[:thread][:post]
    @guest_post.guest_forum = @guest_forum_topic.guest_forum
    @guest_post.guest_forum_topic = @guest_forum_topic
    @guest_post.guest_user = @guest_forum_topic.guest_user
    @guest_post.save

    guest_forum = @guest_forum_topic.guest_forum
    guest_forum.update(updated_at: DateTime.current)

    redirect_to guest_thread_path(@guest_forum_topic.id)
  end

  end

