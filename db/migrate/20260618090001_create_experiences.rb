class CreateExperiences < ActiveRecord::Migration[7.0]
  def change
    create_table :experiences do |t|
      t.references :form, null: false, foreign_key: true
      t.string :job_title
      t.string :company
      t.string :location
      t.string :start_date
      t.string :end_date
      t.text :description
      t.integer :position, default: 0, null: false

      t.timestamps
    end
  end
end
