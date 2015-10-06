class RemoveWhereHeldFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :where_held
    add_reference :items, :building, index: true
    add_foreign_key :items, :building
  end
end
