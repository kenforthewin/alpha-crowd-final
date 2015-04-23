class AddTopicIdToForums < ActiveRecord::Migration
  def change
    add_column :forums, :topic_id, :integer
  end
end
