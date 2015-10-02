class AddIndexToItemsTitle < ActiveRecord::Migration
  def change
    add_index :items, :title, unique: false
  end
end
