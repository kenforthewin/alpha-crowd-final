# == Schema Information
#
# Table name: posts
#
#  id             :integer          not null, primary key
#  text           :text
#  user_id        :integer
#  created_at     :datetime
#  updated_at     :datetime
#  forum_topic_id :integer
#  forum_id       :integer
#

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
