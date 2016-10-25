class CreateRaces < ActiveRecord::Migration[5.0]
  def change
    create_table :races do |t|
      t.string :address
      t.string :city
      t.string :state
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
