class AddForeignKeyToBuildingsInItems < ActiveRecord::Migration
  def change
    add_foreign_key :items, :building
  end
end
