class CreateEducations < ActiveRecord::Migration[7.0]
  def change
    create_table :educations do |t|
      t.references :form, null: false, foreign_key: true
      t.string :degree
      t.string :institution
      t.string :start_date
      t.string :end_date
      t.integer :position, default: 0, null: false

      t.timestamps
    end
  end
end
