class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name, null: false 
      t.string :email, null: false
      t.integer :daily_hours, null: false
      t.string :password_digest, null: false
      t.integer :rank, default: 0

      t.timestamps
    end
  end
end
