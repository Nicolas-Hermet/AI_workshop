class CreateInvoices < ActiveRecord::Migration[8.1]
  def change
    create_table :invoices do |t|
      t.references :mission, null: false, foreign_key: true
      t.integer :amount_cents
      t.string :status
      t.text :internal_notes

      t.timestamps
    end
  end
end
