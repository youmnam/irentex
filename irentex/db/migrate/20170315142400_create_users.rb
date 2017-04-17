class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :usr_fname
      t.string :usr_lname
      t.string :usr_email
      t.string :usr_tel
      t.string :usr_ppic
      t.date :usr_dob
      t.string :usr_address
      t.string :usr_city
      t.string :usr_gover
      t.string :usr_country
      t.string :password_digest
      t.timestamps null: false
    end
  end
end
