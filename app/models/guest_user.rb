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

class GuestUser < ActiveRecord::Base
  acts_as_voter

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => ":style/default.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
