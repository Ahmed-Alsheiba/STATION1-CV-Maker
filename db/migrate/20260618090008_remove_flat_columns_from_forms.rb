class RemoveFlatColumnsFromForms < ActiveRecord::Migration[7.0]
  # Run LAST: only after the data is backfilled into associations and every
  # template/controller path reads associations instead of these columns.
  def change
    remove_column :forms, :degree, :string
    remove_column :forms, :college, :string
    remove_column :forms, :degree_starting_year, :integer
    remove_column :forms, :degree_finishing_year, :integer
    remove_column :forms, :skills, :string
    remove_column :forms, :languages, :string
    remove_column :forms, :prev_job_title, :string
    remove_column :forms, :prev_company, :string
    remove_column :forms, :prev_company_address, :string
    remove_column :forms, :prev_job_starting_year, :integer
    remove_column :forms, :prev_job_ending_year, :integer
    remove_column :forms, :about_prev_job, :text
    remove_column :forms, :ref_name, :string
    remove_column :forms, :ref_email, :string
    remove_column :forms, :ref_phone, :string
  end
end
