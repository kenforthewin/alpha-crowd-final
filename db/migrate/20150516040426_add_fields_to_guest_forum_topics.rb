class AddFieldsToGuestForumTopics < ActiveRecord::Migration
  def change
    add_column :guest_forum_topics, :guest_forum_id, :integer
    add_column :guest_forum_topics, :name, :string
    add_column :guest_forum_topics, :guest_user_id, :integer
    add_column :guest_forum_topics, :sticky, :boolean
  end
end
