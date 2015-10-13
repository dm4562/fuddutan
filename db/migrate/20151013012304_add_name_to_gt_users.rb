class AddNameToGtUsers < ActiveRecord::Migration
  def change
    add_column :gt_users, :name, :string
  end
end
