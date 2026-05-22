class CreateAuditEvents < ActiveRecord::Migration[8.1]
  def change
    create_table :audit_events do |t|
      t.references :user, foreign_key: true
      t.string :action
      t.string :target_type
      t.integer :target_id
      t.datetime :occurred_at

      t.timestamps
    end
  end
end
