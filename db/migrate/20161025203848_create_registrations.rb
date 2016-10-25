class CreateRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :registrations do |t|
      t.references :race, foreign_key: true
      t.references :user, foreign_key: true
      t.references :boat_class, foreign_key: true

      t.timestamps
    end
  end
end
