class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :component_pressure_tests, :type, :component_type
  end
end
