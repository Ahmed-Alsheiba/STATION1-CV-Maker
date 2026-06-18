class AddTemplateToForms < ActiveRecord::Migration[7.0]
  def change
    add_column :forms, :template, :integer, default: 0, null: false
  end
end
