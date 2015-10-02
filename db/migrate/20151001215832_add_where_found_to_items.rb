class AddWhereFoundToItems < ActiveRecord::Migration
  def change
    add_column :items, :where_found, :string
  end
end
