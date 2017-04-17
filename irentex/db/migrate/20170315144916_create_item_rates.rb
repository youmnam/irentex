class CreateItemRates < ActiveRecord::Migration
  def change
    create_table :item_rates do |t|
      t.references :ir_item, index: true, foreign_key: true
      t.references :ir_user, index: true, foreign_key: true
      t.decimal :ir_rate
      t.text :ir_comment

      t.timestamps null: false
    end
  end
end
