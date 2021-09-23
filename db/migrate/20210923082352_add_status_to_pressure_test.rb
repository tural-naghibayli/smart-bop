class AddStatusToPressureTest < ActiveRecord::Migration[6.0]
  def change
    add_column :pressure_tests, :status, :string, :default => "Pending"
  end
end
