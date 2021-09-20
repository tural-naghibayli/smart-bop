class CreatePressureTests < ActiveRecord::Migration[6.0]
  def change
    create_table :pressure_tests do |t|
      t.date :last_test_date
      t.date :completed_date
      t.date :next_test_deadline
      t.string :test_fluid
      t.string :well_name
      t.string :serial_number_of_chart_recorder
      t.text :comment
      t.text :corrective_action
      t.string :drill_pipe_diameter_for_test
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
