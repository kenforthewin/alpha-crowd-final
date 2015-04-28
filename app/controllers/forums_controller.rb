class ForumsController < ApplicationController
  respond_to :html

  def index
    @stickies = Forum.sticky_forums
    @forums = Forum.all.order('updated_at DESC').page(params[:page])
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
