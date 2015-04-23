# == Schema Information
#
# Table name: forums
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  topic_id    :integer
#

class Forum < ActiveRecord::Base
	has_many :forum_topics
	belongs_to :topic
	validates :name, :description, :presence => :true
	has_many :posts, through: :forum_topics
end
