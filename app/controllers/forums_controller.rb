class ForumsController < ApplicationController
  respond_to :html

  def index
    @general = Forum.find_by_name 'General'
    unless @general.nil?
      @top_general = @general.forum_topics.order("updated_at").last
    end
    @forums = Forum.page(params[:page]).order('updated_at DESC')
    @forums_list = true
  end

  def create
    @forum = Forum.new(forum_params)
    @forum.save
    respond_with(@forum)
  end

  private
    def set_forum
      @forum = Forum.find(params[:id])
    end

    def forum_params
      params.require(:forum).permit(:name, :description)
    end
end
