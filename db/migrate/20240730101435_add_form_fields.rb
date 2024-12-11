class AddFormFields < ActiveRecord::Migration[7.0]
  def change
    add_column :forms, :first_name, :string
    add_column :forms, :last_name, :string
    add_column :forms, :phone, :string
    add_column :forms, :email, :string
    add_column :forms, :address, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
