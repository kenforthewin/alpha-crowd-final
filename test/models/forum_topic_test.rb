# == Schema Information
#
# Table name: forum_topics
#
#  id         :integer          not null, primary key
#  forum_id   :integer
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class ForumTopicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
