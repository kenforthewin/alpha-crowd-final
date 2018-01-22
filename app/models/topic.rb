# == Schema Information
#
# Table name: topics
#
#  id                      :integer          not null, primary key
#  title                   :string(255)
#  text_field              :text
#  user_id                 :integer
#  created_at              :datetime
#  updated_at              :datetime
#  cached_votes_total      :integer          default(0)
#  cached_votes_score      :integer          default(0)
#  cached_votes_up         :integer          default(0)
#  cached_votes_down       :integer          default(0)
#  cached_weighted_score   :integer          default(0)
#  cached_weighted_total   :integer          default(0)
#  cached_weighted_average :float            default(0.0)
#

class Topic < ActiveRecord::Base
	has_one :forum
	acts_as_votable
	belongs_to :user
	validates :title, :text_field, :user_id, :presence => :true

	self.per_page = 10

	after_save :create_forum

	private

	def create_forum
		forum = Forum.new
		forum.name = self.title
		forum.description = self.text_field
		forum.topic_id = self.id
		forum.save

		pro_thread = ForumTopic.new
		pro_thread.user = self.user
		pro_thread.sticky = true
		pro_thread.forum = forum
		pro_thread.name = 'Pros'
		pro_thread.save

		con_thread = ForumTopic.new
		con_thread.user = self.user
		con_thread.sticky = true
		con_thread.forum = forum
		con_thread.name = "Cons"
		con_thread.save
	end
end
