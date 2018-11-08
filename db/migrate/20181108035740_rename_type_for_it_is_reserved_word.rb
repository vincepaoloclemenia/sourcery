class RenameTypeForItIsReservedWord < ActiveRecord::Migration[5.1]
  def change
    rename_column :employments, :type, :employment_type
  end
end
