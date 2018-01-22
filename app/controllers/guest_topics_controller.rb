class GuestTopicsController < ApplicationController
  before_action :set_guest_topic
  def upvote
    if current_guest_user.liked? @guest_topic
      @guest_topic.unliked_by current_guest_user
    else
      @guest_topic.vote_by :voter => current_guest_user, :vote => 'like'
    end

    respond_to do |format|
      format.js
      format.html { redirect_to root_path }
    end
  end


  def downvote
    if current_guest_user.disliked? @guest_topic
      @guest_topic.undisliked_by current_guest_user
    else
      @guest_topic.downvote_from current_guest_user
    end

    respond_to do |format|
      format.js
      format.html { redirect_to root_path }
    end
  end

  private

  def set_guest_topic
    @guest_topic = GuestTopic.find_by_id(params[:id])
  end
end
