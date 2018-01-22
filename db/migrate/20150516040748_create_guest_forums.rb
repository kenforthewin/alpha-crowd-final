class CreateGuestForums < ActiveRecord::Migration
  def change
    create_table :guest_forums do |t|
      t.string :name
      t.text :description
      t.integer :guest_topic_id
      t.boolean :sticky

      t.timestamps
    end
  end
end
