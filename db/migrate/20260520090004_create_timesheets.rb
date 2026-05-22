class CreateTimesheets < ActiveRecord::Migration[8.1]
  def change
    create_table :timesheets do |t|
      t.references :employee, foreign_key: true
      t.references :project, foreign_key: true
      t.date :work_date
      t.decimal :hours, precision: 5, scale: 2
      t.boolean :billable, default: true

      t.timestamps
    end
  end
end
