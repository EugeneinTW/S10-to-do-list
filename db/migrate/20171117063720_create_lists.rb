class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.string :title
      t.date :due_date
      t.text :description
      t.timestamps
    end
  end
end
