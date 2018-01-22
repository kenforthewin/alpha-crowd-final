class AddFieldsToGuestTopics < ActiveRecord::Migration
  def change
    add_column :guest_topics, :title, :string
    add_column :guest_topics, :text_field, :text
    add_column :guest_topics, :user_id, :integer
  end
end
