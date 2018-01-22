class CreateGuestForumTopics < ActiveRecord::Migration
  def change
    create_table :guest_forum_topics do |t|

      t.timestamps
    end
  end
end
