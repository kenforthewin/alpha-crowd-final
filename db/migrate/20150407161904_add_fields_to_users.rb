class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :handle, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :admin, :boolean
  end
end
