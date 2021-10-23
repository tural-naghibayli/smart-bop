class CreateComponentFunctionTests < ActiveRecord::Migration[6.0]
  def change
    create_table :component_function_tests do |t|
      t.references :function_test, null: false, foreign_key: true
      t.string :bop_element_unit
      t.integer :open_gallons
      t.integer :open_time
      t.integer :close_gallons
      t.integer :close_time

      t.timestamps
    end
  end
end
