# == Schema Information
#
# Table name: guest_posts
#
#  id                      :integer          not null, primary key
#  text                    :text
#  guest_user_id           :string(255)
#  guest_forum_topic_id    :integer
#  guest_forum_id          :integer
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

class GuestPost < ActiveRecord::Base
  belongs_to :guest_forum_topic
  belongs_to :guest_forum
  belongs_to :guest_user
  acts_as_votable
  validates :text, :guest_user_id, :guest_forum_topic_id, :guest_forum_id, :presence => :true
end
