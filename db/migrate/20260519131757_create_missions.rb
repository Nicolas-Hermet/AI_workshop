class CreateMissions < ActiveRecord::Migration[8.1]
  def change
    create_table :missions do |t|
      t.string :title
      t.references :client, null: false, foreign_key: true
      t.references :consultant, null: false, foreign_key: { to_table: :users }
      t.integer :hours
      t.integer :hourly_rate
      t.text :private_notes

      t.timestamps
    end
  end
end
