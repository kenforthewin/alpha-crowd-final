# == Schema Information
#
# Table name: posts
#
#  id             :integer          not null, primary key
#  text           :text
#  user_id        :integer
#  created_at     :datetime
#  updated_at     :datetime
#  forum_topic_id :integer
#  forum_id       :integer
#

class Post < ActiveRecord::Base
	belongs_to :forum_topic
	belongs_to :forum
	belongs_to :user

	validates :text, :user_id, :forum_topic_id, :forum_id, :presence => :true
end
