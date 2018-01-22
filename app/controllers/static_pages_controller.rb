class StaticPagesController < ApplicationController
  def deathgrips
  end

  def home
  	if user_signed_in?
  		redirect_to topics_path
  	end
  	@home_jumbotron = true
  	@user = User.new
    guest_topic
  end

  def new_home
  end
end
