# == Schema Information
#
# Table name: guest_forums
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  description    :text
#  guest_topic_id :integer
#  sticky         :boolean
#  created_at     :datetime
#  updated_at     :datetime
#

class GuestForum < ActiveRecord::Base
  has_many :guest_forum_topics
  belongs_to :guest_topic
  validates :name, :description, :presence => :true
  has_many :guest_posts, through: :guest_forum_topics

  scope :sticky_forums, -> {where("sticky = true")}
  scope :nonsticky_forums, -> {where("sticky != true")}
end
