class CreateComponentFunctionTests < ActiveRecord::Migration[6.0]
  def change
    create_table :component_function_tests do |t|
      t.string :unit_name
      t.integer :open_gallons
      t.integer :open_time
      t.integer :close_gallons
      t.integer :close_time
      t.string :status
      t.text :additional_notes
      t.references :function_test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
