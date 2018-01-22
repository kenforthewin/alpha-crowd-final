# == Schema Information
#
# Table name: guest_topics
#
#  id                      :integer          not null, primary key
#  created_at              :datetime
#  updated_at              :datetime
#  title                   :string(255)
#  text_field              :text
#  user_id                 :integer
#  cached_votes_total      :integer          default(0)
#  cached_votes_score      :integer          default(0)
#  cached_votes_up         :integer          default(0)
#  cached_votes_down       :integer          default(0)
#  cached_weighted_score   :integer          default(0)
#  cached_weighted_total   :integer          default(0)
#  cached_weighted_average :float            default(0.0)
#

class GuestTopic < ActiveRecord::Base
  has_one :guest_forum
  acts_as_votable
  belongs_to :user
  validates :title, :text_field, :user_id, :presence => :true

  after_save :create_forum

  private

  def create_forum
    current_guest_user = GuestUser.create
    forum = GuestForum.new
    forum.name = self.title
    forum.description = self.text_field
    forum.guest_topic_id = self.id
    forum.save

    pro_thread = GuestForumTopic.new
    pro_thread.guest_user = current_guest_user
    pro_thread.sticky = true
    pro_thread.guest_forum = forum
    pro_thread.name = 'Pros'
    pro_thread.save

    con_thread = GuestForumTopic.new
    con_thread.guest_user = current_guest_user
    con_thread.sticky = true
    con_thread.guest_forum = forum
    con_thread.name = 'Cons'
    con_thread.save
  end
end
