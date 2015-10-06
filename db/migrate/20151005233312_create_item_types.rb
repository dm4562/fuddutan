class CreateItemTypes < ActiveRecord::Migration
  def change
    create_table :item_types do |t|
      t.string :name
      t.references :item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
