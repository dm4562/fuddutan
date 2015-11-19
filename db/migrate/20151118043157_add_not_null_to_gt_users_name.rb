class AddNotNullToGtUsersName < ActiveRecord::Migration
  def change
    change_column :gt_users, :name, :string, null: false
    add_column :gt_users, :username, :string
    # change_column :gt_users, :username, :string, null: false, unique: true
    add_index :gt_users, :username
  end
end
