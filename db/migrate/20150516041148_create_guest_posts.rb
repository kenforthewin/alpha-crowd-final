class CreateGuestPosts < ActiveRecord::Migration
  def change
    create_table :guest_posts do |t|
      t.text :text
      t.string :guest_user_id
      t.integer :guest_forum_topic_id
      t.integer :guest_forum_id

      t.timestamps
    end
  end
end
