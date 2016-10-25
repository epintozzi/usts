class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :boat_number
      t.string :usts_number
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
