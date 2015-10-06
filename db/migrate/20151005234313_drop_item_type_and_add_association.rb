class DropItemTypeAndAddAssociation < ActiveRecord::Migration
  def change
    remove_column :items, :item_type
    add_reference :items, :item_type, index: true, foreign_key: true
    remove_column :item_types, :item_id
  end
end
