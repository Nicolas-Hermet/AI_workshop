class CreateVendors < ActiveRecord::Migration[8.1]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :contact_email
      t.string :category
      t.integer :rating

      t.timestamps
    end
  end
end
