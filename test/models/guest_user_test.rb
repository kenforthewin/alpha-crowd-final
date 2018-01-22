# == Schema Information
#
# Table name: guest_users
#
#  id                  :integer          not null, primary key
#  created_at          :datetime
#  updated_at          :datetime
#  identifier          :string(255)
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

require 'test_helper'

class GuestUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
