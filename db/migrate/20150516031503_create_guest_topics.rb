class CreateGuestTopics < ActiveRecord::Migration
  def change
    create_table :guest_topics do |t|

      t.timestamps
    end
  end
end
