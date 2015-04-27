class AddForumStatusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :forum_status, :string
  end
end
