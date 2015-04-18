class CreateForumTopics < ActiveRecord::Migration
  def change
    create_table :forum_topics do |t|
      t.integer :forum_id
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
