class CreateComponentPressureTests < ActiveRecord::Migration[6.0]
  def change
    create_table :component_pressure_tests do |t|
      t.string :bop_element_unit
      t.string :size_type
      t.integer :low_pressure_value
      t.integer :high_pressure_value
      t.boolean :test_result
      t.references :pressure_test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
