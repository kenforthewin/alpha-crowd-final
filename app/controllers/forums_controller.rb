class ForumsController < ApplicationController
  respond_to :html

  def index
    @forums = Forum.all
    respond_with(@forums)
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
