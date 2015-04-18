class AddAvatarColumnsToUsers < ActiveRecord::Migration
  def change
  	add_attachment :users, :avatar
  	remove_attachment :users, :avatar
  end
end
