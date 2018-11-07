class CreateEmployments < ActiveRecord::Migration[5.1]
  def change
    create_table :employments do |t|
      t.string :type
      t.string :date_employed
      t.references :client, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
