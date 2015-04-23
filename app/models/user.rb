# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#  handle                 :string(255)
#  first_name             :string(255)
#  last_name              :string(255)
#  admin                  :boolean
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  banned                 :boolean
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	
	has_many :topics
	has_many :forum_topics
	has_many :posts

	validates :first_name, :last_name, presence: true

  validates :handle, uniqueness: true

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => ":style/default.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  acts_as_messageable
  acts_as_voter

  def full_name
  	first_name + " " + last_name
  end

  def name
  	first_name + " " + last_name
  end

  def mailboxer_email(object)
    email
  end
end
