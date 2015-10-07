class ChangeItems < ActiveRecord::Migration
  def up
    change_column :items, :where_held, 'integer USING CAST(column_name AS integer)'
  end

  def down
    change_column :items, :where_held, :string
  end
end
