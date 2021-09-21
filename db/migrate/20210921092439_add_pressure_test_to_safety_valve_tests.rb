class AddPressureTestToSafetyValveTests < ActiveRecord::Migration[6.0]
  def change
    add_reference :safety_valve_tests, :pressure_test, null: false, foreign_key: true
  end
end
