class CreateWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :works do |t|
      t.references :user, foreign_key: true
      t.string :position
      t.string :company
      t.date :from
      t.date :to
      t.boolean :status
      t.text :tasks
      t.string :level

      t.timestamps
    end
  end
end
