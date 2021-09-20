class CreateSafetyValveTests < ActiveRecord::Migration[6.0]
  def change
    create_table :safety_valve_tests do |t|
      t.string :unit
      t.string :serial_number
      t.string :connection_type
      t.integer :high_pressure
      t.integer :low_pressure
      t.boolean :test_result
      t.references :pressure_test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
