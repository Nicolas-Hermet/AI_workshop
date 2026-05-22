class CreateSecrets < ActiveRecord::Migration[8.1]
  def change
    create_table :secrets do |t|
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
