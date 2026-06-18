class CreateCertifications < ActiveRecord::Migration[7.0]
  def change
    create_table :certifications do |t|
      t.references :form, null: false, foreign_key: true
      t.string :name
      t.integer :position, default: 0, null: false

      t.timestamps
    end
  end
end
