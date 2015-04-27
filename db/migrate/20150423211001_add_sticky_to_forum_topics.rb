class AddStickyToForumTopics < ActiveRecord::Migration
  def change
    add_column :forum_topics, :sticky, :boolean
  end
end
