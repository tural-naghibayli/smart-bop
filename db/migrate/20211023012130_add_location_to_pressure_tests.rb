class AddLocationToPressureTests < ActiveRecord::Migration[6.0]
  def change
    add_column :pressure_tests, :location, :string
  end
end
