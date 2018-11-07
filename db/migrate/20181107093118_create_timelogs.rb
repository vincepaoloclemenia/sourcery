class CreateTimelogs < ActiveRecord::Migration[5.1]
  def change
    create_table :timelogs do |t|
      t.references :user, foreign_key: true
      t.datetime :login
      t.date :date
      t.datetime :logout
      t.datetime :break_out
      t.datetime :break_in
      t.decimal :overtime
      t.references :client, foreign_key: true
      t.decimal :undertime
      t.datetime :overtime_in
      t.decimal :total_break_hours
      t.decimal :total_hours
      t.datetime :overtime_out
      t.boolean :is_holiday
      t.decimal :total_pay
      t.string :valid_ot
      t.string :shift
      t.decimal :overtime_pay
      t.decimal :gross_pay

      t.timestamps
    end
  end

  add_column :inquiries, :contact_number, :string
end
