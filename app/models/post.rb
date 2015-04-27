# == Schema Information
#
# Table name: posts
#
#  id                      :integer          not null, primary key
#  text                    :text
#  user_id                 :integer
#  created_at              :datetime
#  updated_at              :datetime
#  forum_topic_id          :integer
#  forum_id                :integer
#  cached_votes_total      :integer          default(0)
#  cached_votes_score      :integer          default(0)
#  cached_votes_up         :integer          default(0)
#  cached_votes_down       :integer          default(0)
#  cached_weighted_score   :integer          default(0)
#  cached_weighted_total   :integer          default(0)
#  cached_weighted_average :float            default(0.0)
#

class Post < ActiveRecord::Base
	belongs_to :forum_topic
	belongs_to :forum
	belongs_to :user
	acts_as_votable
	validates :text, :user_id, :forum_topic_id, :forum_id, :presence => :true
end
