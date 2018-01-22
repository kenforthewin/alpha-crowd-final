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

require 'test_helper'

class GuestForumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
