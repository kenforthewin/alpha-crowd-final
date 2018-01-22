# == Schema Information
#
# Table name: guest_forum_topics
#
#  id             :integer          not null, primary key
#  created_at     :datetime
#  updated_at     :datetime
#  guest_forum_id :integer
#  name           :string(255)
#  guest_user_id  :integer
#  sticky         :boolean
#

class GuestForumTopic < ActiveRecord::Base
  belongs_to :guest_user
  belongs_to :guest_forum
  has_many :guest_posts

  self.per_page = 20

  scope :sticky_threads, -> {where("sticky = true")}
  scope :nonsticky_threads, -> {where("sticky != true")}
end
