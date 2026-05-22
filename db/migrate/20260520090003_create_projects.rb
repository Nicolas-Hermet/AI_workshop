class CreateProjects < ActiveRecord::Migration[8.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :code
      t.references :client, foreign_key: true
      t.string :status
      t.date :starts_on
      t.date :ends_on
      t.integer :budget_cents

      t.timestamps
    end
  end
end
