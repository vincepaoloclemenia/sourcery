class FixAttributeForEmployment < ActiveRecord::Migration[5.1]
  def change
    remove_column :employments, :date_employed
    add_column :employments, :employment_date, :date
  end
end
