class RefferenceFields < ActiveRecord::Migration[7.0]
  def change
    add_column :forms, :about_you, :text
    add_column :forms, :ref_name, :string
    add_column :forms, :ref_email, :string
    add_column :forms, :ref_phone, :string
  end
end
