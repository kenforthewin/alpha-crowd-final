class UsersController < ApplicationController
	before_action :authenticate_user!

	def settings
		@user = current_user
	end

	def update
		@user = current_user
		@user.update(user_params)
		flash[:notice] = "Profile Updated"
		redirect_to root_path
	end

	def profile
		@user = User.find(params[:id])
		@topics = @user.topics.order('created_at DESC').first(5)
		@posts = @user.posts.order('created_at DESC').first(5)
	end

	private
		def user_params
			params[:user].permit(:first_name, :last_name, :handle, :avatar)
		end
end
