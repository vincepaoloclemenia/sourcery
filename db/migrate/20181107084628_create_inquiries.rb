class CreateInquiries < ActiveRecord::Migration[5.1]
  def change
    create_table :inquiries do |t|
      t.string :company_name
      t.string :address
      t.string :industry
      t.string :company_function
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :position
      t.string :company_size
      t.string :info_from

      t.timestamps
    end
  end
end
