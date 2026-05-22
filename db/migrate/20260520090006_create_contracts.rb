class CreateContracts < ActiveRecord::Migration[8.1]
  def change
    create_table :contracts do |t|
      t.references :client, foreign_key: true
      t.string :reference
      t.date :signed_on
      t.integer :value_cents
      t.string :status

      t.timestamps
    end
  end
end
