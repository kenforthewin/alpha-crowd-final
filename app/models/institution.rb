# == Schema Information
#
# Table name: institutions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  subdomain  :string(255)
#

class Institution < ActiveRecord::Base
  attr_accessor :email, :first_name, :last_name, :password, :password_confirmation

  after_save :create_admin


  private

  def create_admin
    admin = User.create(first_name: first_name, last_name: last_name, password: password, password_confirmation: password_confirmation, email: email)

    unless admin
      self.destroy
    end
  end
end
