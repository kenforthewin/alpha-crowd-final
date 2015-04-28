class AddStickyToForums < ActiveRecord::Migration
  def change
    add_column :forums, :sticky, :boolean
  end
end
