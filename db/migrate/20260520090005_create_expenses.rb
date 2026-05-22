class CreateExpenses < ActiveRecord::Migration[8.1]
  def change
    create_table :expenses do |t|
      t.references :employee, foreign_key: true
      t.string :category
      t.integer :amount_cents
      t.date :spent_on
      t.string :status
      t.string :memo

      t.timestamps
    end
  end
end
