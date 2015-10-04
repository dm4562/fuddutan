class RemoveConnectedLostItemsFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :connected_lost_items
  end

end
