class CreateBoardNotes < ActiveRecord::Migration[8.1]
  def change
    create_table :board_notes do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
