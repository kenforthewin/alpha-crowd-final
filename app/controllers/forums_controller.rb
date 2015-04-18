class ForumsController < ApplicationController
  before_action :set_forum, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @forums = Forum.all
    respond_with(@forums)
  end

  def show
    respond_with(@forum)
  end

  def new
    @forum = Forum.new
    respond_with(@forum)
  end

  def edit
  end

  def create
    @forum = Forum.new(forum_params)
    @forum.save
    respond_with(@forum)
  end

  def update
    @forum.update(forum_params)
    respond_with(@forum)
  end

  def destroy
    @forum.destroy
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
