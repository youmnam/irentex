class CreateRentps < ActiveRecord::Migration
  def change
    create_table :rentps do |t|
      t.string :rp_address
      t.string :rp_city
      t.string :rp_gover
      t.string :rp_country
      t.references :user, index: true, foreign_key: true
	  t.timestamps null: false
    end
  end
end
