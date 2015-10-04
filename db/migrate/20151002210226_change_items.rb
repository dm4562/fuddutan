class ChangeItems < ActiveRecord::Migration
  def up
    change_column :items, :where_held, :integer
  end

  def down
    change_column :items, :where_held, :string
  end
end
