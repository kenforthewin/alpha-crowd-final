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

require 'test_helper'

class GuestForumTopicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
