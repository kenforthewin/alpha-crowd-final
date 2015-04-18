class AddForumTopicIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :forum_topic_id, :integer
  end
end
