class CreateUserRates < ActiveRecord::Migration
  def change
    create_table :user_rates do |t|
      t.references :ur_owner, index: true, foreign_key: true
      t.references :ur_user, index: true, foreign_key: true
      t.decimal :ur_trustrate
      t.decimal :ur_onTimeRate
      t.text :ur_comment

      t.timestamps null: false
    end
  end
end
