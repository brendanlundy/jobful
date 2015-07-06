class AddApplicationStatusToJobApplications < ActiveRecord::Migration
  def change
    add_column :job_applications, :application_status, :string
    add_column :job_applications, :is_archived, :boolean, default: false
  end
end
