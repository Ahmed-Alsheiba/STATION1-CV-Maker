class StudyFieldsToForms < ActiveRecord::Migration[7.0]
  def change
    add_column :forms, :degree, :string
    add_column :forms, :college, :string
    add_column :forms, :degree_starting_year, :integer
    add_column :forms, :degree_finishing_year, :integer

    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
