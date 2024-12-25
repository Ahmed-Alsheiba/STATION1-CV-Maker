class ExperinceFields < ActiveRecord::Migration[7.0]
  def change
    add_column :forms, :skills, :string
    add_column :forms, :languages, :string
    add_column :forms, :prev_job_title, :string
    add_column :forms, :prev_company, :string
    add_column :forms, :prev_company_address, :string
    add_column :forms, :prev_job_starting_year, :integer
    add_column :forms, :prev_job_ending_year, :integer
    add_column :forms, :about_prev_job, :text
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
