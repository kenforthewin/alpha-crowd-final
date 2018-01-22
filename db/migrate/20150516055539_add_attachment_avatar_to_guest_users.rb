class AddAttachmentAvatarToGuestUsers < ActiveRecord::Migration
  def self.up
    change_table :guest_users do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :guest_users, :avatar
  end
end
