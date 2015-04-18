# == Schema Information
#
# Table name: forum_topics
#
#  id         :integer          not null, primary key
#  forum_id   :integer
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class ForumTopic < ActiveRecord::Base
	belongs_to :user
	belongs_to :forum
	has_many :posts
	validates :forum_id, :name, :user_id, :presence => :true

	self.per_page = 20
end
