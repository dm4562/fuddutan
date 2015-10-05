class AddDeafaultFasleValueToHasId < ActiveRecord::Migration
  def change
    change_column :items, :has_id, :boolean, default: false
  end
end
