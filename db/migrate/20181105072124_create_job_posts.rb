class CreateJobPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :job_posts do |t|
      t.string :title
      t.string :industry
      t.integer :years_of_exp
      t.text :description
      t.integer :emp_needed

      t.timestamps
    end
  end
end
