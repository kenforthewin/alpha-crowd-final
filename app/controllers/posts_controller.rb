class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:upvote, :downvote]

  respond_to :html


  def index
    @thread = ForumTopic.find_by_id(params[:forum_topic_id])
    @forum = @thread.forum
    if params[:sort].eql? 'vote'
      @posts = @thread.posts.order('cached_weighted_score DESC').page(params[:page])
    else
      @posts = @thread.posts.order('created_at ASC').page(params[:page])
    end

    @thread_response = true
    #respond_with(@posts)
  end

  def new
    @post = Post.new
    @thread_response = true
    @user = current_user
    @thread = ForumTopic.find_by_id(params[:forum_topic_id])
    @forum = @thread.forum

    if @forum.nil? or @thread.nil?
      return redirect_to root_path
    end
  end

    def upvote
    if !current_user.liked? @post
      @post.vote_by :voter => current_user, vote: 'like'
      if @post.user != current_user
        @post.user.vote_by :voter => current_user, vote: 'like'
      end
    end
    redirect_to thread_path(@post.forum_topic)
  end

  def downvote
    if !current_user.disliked? @post
      @post.downvote_from current_user
      if @post.user != current_user
        @post.user.downvote_from current_user
      end
    end
    redirect_to thread_path(@post.forum_topic)
  end

  def create
    @post = Post.new
    @post.user = current_user
    @post.forum_id = params[:post][:forum_id]
    @post.forum_topic_id = params[:post][:forum_topic_id]
    @post.text = params[:post][:text]
    @post.save

    @post.vote_by :voter => current_user, vote: 'like'

    thread = @post.forum_topic
    thread.updated_at = DateTime.now
    thread.save

    flash[:notice] = 'Post saved'
    redirect_to thread_path(thread)
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:topic_id, :text, :user_id)
    end
end
