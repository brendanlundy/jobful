class CreateJobApplications < ActiveRecord::Migration
  def change
    create_table :job_applications do |t|
    	t.references :user, index: true, foreign_key: true
      t.string :company_name, null: false
      t.string :job_title, null: false
      t.string :job_link
      t.integer :interest_level
      t.datetime :submit_date
      t.text :job_description
      t.text :notes
      t.string :city
      t.string :state

      t.timestamps null: false
    end
  end
end
