class CreateEmployees < ActiveRecord::Migration[8.1]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :job_title
      t.string :email
      t.references :department, foreign_key: true
      t.date :hired_on
      t.integer :salary_cents

      t.timestamps
    end
  end
end
