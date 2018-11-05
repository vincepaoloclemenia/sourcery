class CreateEducations < ActiveRecord::Migration[5.1]
  def change
    create_table :educations do |t|
      t.references :user, foreign_key: true
      t.string :school
      t.date :from
      t.date :to
      t.string :course

      t.timestamps
    end
  end
end
