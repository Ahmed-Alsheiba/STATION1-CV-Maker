class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills do |t|
      t.references :form, null: false, foreign_key: true
      t.string :name
      t.integer :level
      t.integer :position, default: 0, null: false

      t.timestamps
    end
  end
end
