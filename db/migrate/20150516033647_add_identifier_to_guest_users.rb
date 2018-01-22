class AddIdentifierToGuestUsers < ActiveRecord::Migration
  def change
    add_column :guest_users, :identifier, :string
  end
end
