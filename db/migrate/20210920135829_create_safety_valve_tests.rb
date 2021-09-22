class CreateSafetyValveTests < ActiveRecord::Migration[6.0]
  def change
    create_table :safety_valve_tests do |t|
      t.string :unit
      t.string :serial_number
      t.string :connection_type
      t.integer :high_pressure
      t.integer :low_pressure
      t.string :test_result


      t.timestamps
    end
  end
end
