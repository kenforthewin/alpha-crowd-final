class AdminController < ApplicationController
	before_action :authenticate_admin

	def delete_post
		@post = Post.find_by_id(params[:post_id])
		@thread = @post.forum_topic
		@post.destroy

		flash[:notice] = 'Post deleted'
		redirect_to thread_path(@thread)
	end

	def delete_topic
		@topic = Topic.find_by_id(params[:topic_id])
		@topic.destroy

		flash[:notice] = 'Topic deleted'
		redirect_to root_path
	end

	def delete_thread
		@thread = ForumTopic.find_by_id(params[:forum_topic_id])
		@forum = @thread.forum

		if !@thread.posts.nil?
			@thread.posts.each do |post|
				post.destroy
			end
		end

		@thread.destroy
		flash[:notice] = 'Thread deleted'
		redirect_to show_forum_path(@forum)

	end

	def ban_user
		@user = User.find_by_id(params[:user_id])
		@user.banned = true
		@user.save
		
		flash[:notice] = 'This user has been banned'
		redirect_to user_profile_path(@user)
	end

	def report_index
	end

	def make_sticky
	end

	def manage_users
	end




	private

	def authenticate_admin
		if !current_user.admin?
			flash[:notice] = 'You are not authorized to perform this action.'
			redirect_to root_path
		end
	end
end
