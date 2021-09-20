class CreateBops < ActiveRecord::Migration[6.0]
  def change
    create_table :bops do |t|
      t.string :serial_number
      t.string :bop_type
      t.string :producer
      t.string :pressure_rating
      t.string :description
      t.references :rig, null: false, foreign_key: true

      t.timestamps
    end
  end
end
