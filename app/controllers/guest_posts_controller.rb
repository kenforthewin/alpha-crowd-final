class GuestPostsController < ApplicationController
  before_action :set_guest_post, only: [:upvote, :downvote]

  respond_to :html


  def index
    @thread = GuestForumTopic.find_by_id(params[:guest_forum_topic_id])
    @guest_forum = @thread.guest_forum
    if params[:sort].eql? 'vote'
      @posts = @thread.guest_posts.order('cached_weighted_score DESC').page(params[:page])
    else
      @posts = @thread.guest_posts.order('created_at ASC').page(params[:page])
    end

    @thread_response = true
    #respond_with(@posts)
  end

  def new
    @guest_post = GuestPost.new
    @thread_response = true
    @guest_user = current_guest_user
    @thread = GuestForumTopic.find_by_id(params[:guest_forum_topic_id])
    @guest_forum = @thread.guest_forum

    if @guest_forum.nil? or @thread.nil?
      return redirect_to root_path
    end
  end

  def upvote
    if !current_guest_user.liked? @guest_post
      @guest_post.vote_by :voter => current_guest_user, vote: 'like'
    end
    redirect_to guest_thread_path(@guest_post.guest_forum_topic)
  end

  def downvote
    if !current_guest_user.disliked? @guest_post
      @guest_post.downvote_from current_guest_user
    end
    redirect_to guest_thread_path(@guest_post.guest_forum_topic)
  end

  def create
    @post = GuestPost.new
    @post.guest_user = current_guest_user
    @post.guest_forum_id = params[:post][:guest_forum_id]
    @post.guest_forum_topic_id = params[:post][:guest_forum_topic_id]
    @post.text = params[:post][:text]
    @post.save

    @post.vote_by :voter => current_guest_user, vote: 'like'

    thread = @post.guest_forum_topic
    thread.updated_at = DateTime.now
    thread.save

    flash[:notice] = 'Post saved'
    redirect_to guest_thread_path(thread)
  end

  private
  def set_guest_post
    @guest_post = GuestPost.find(params[:id])
  end
end
