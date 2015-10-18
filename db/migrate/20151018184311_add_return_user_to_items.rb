class AddReturnUserToItems < ActiveRecord::Migration
  def change
    add_reference :items, :return_user, index: true, foreign_key: true
  end
end
