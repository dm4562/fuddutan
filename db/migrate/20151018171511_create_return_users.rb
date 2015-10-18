class CreateReturnUsers < ActiveRecord::Migration
  def change
    create_table :return_users do |t|
      t.string :name
      t.integer :gtid
      t.string :state_id
      t.references :items, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
