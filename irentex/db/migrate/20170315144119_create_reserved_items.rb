class CreateReservedItems < ActiveRecord::Migration
  def change
    create_table :reserved_items do |t|
      t.references :item, index: true, foreign_key: true
      t.date :res_startDate
      t.date :res_endDate
      t.references :res_user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
