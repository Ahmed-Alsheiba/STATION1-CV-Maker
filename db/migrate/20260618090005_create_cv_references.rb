class CreateCvReferences < ActiveRecord::Migration[7.0]
  def change
    create_table :cv_references do |t|
      t.references :form, null: false, foreign_key: true
      t.string :name
      t.string :title
      t.string :company
      t.string :phone
      t.string :email
      t.integer :position, default: 0, null: false

      t.timestamps
    end
  end
end
