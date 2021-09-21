class CreateComponentPressureTests < ActiveRecord::Migration[6.0]
  def change
    create_table :component_pressure_tests do |t|
      t.string :bop_element_unit
      t.string :type
      t.integer :low_pressure
      t.integer :high_pressure
      t.string :test_result
      t.integer :open_gallons
      t.integer :open_time
      t.integer :close_gallons
      t.integer :close_time
      t.references :pressure_test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
