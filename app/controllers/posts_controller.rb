class PostsController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  def index
    @thread = ForumTopic.find_by_id(params[:forum_topic_id])
    @forum = @thread.forum
    @posts = @thread.posts.page(params[:page]).order('created_at ASC')

    @thread_response = true
    #respond_with(@posts)
  end

  def new
    @post = Post.new
    @user = current_user
    @thread = ForumTopic.find_by_id(params[:forum_topic_id])
    @forum = @thread.forum

    if @forum.nil? or @thread.nil?
      return redirect_to root_path
    end
  end

  def create
    @post = Post.new
    @post.user = current_user
    @post.forum_id = params[:post][:forum_id]
    @post.forum_topic_id = params[:post][:forum_topic_id]
    @post.text = params[:post][:text]
    @post.save

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
