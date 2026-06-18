class CreateLanguages < ActiveRecord::Migration[7.0]
  def change
    create_table :languages do |t|
      t.references :form, null: false, foreign_key: true
      t.string :name
      t.integer :level
      t.integer :position, default: 0, null: false

      t.timestamps
    end
  end
end
