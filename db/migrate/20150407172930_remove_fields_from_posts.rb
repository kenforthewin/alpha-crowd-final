class RemoveFieldsFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :topic_id, :string
  end
end
