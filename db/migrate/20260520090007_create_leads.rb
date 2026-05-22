class CreateLeads < ActiveRecord::Migration[8.1]
  def change
    create_table :leads do |t|
      t.string :company_name
      t.string :contact_name
      t.string :email
      t.string :phone
      t.string :source
      t.string :status
      t.integer :estimated_value_cents

      t.timestamps
    end
  end
end
