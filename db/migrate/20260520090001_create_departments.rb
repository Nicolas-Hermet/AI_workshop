class CreateDepartments < ActiveRecord::Migration[8.1]
  def change
    create_table :departments do |t|
      t.string :name
      t.string :code
      t.integer :budget_cents
      t.integer :headcount

      t.timestamps
    end
  end
end
