class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item_name
      t.string :item_desc
      t.decimal :item_price
      t.references :rentp, index: true, foreign_key: true,null: false

      t.timestamps null: false
    end
  end
end
