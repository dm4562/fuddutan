class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :type
      t.string :title
      t.boolean :has_id
      t.datetime :when_found
      t.string :where_held
      t.boolean :connected_lost_items
      t.text :description

      t.timestamps null: false
    end
  end
end
