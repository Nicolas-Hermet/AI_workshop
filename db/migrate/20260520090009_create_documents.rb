class CreateDocuments < ActiveRecord::Migration[8.1]
  def change
    create_table :documents do |t|
      t.string :title
      t.string :doc_type
      t.references :user, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
