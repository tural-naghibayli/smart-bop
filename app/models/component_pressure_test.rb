class ComponentPressureTest < ApplicationRecord
  belongs_to :pressure_test
  validates :bop_element_unit, :low_pressure, :high_pressure, :test_result, :open_gallons,
            :close_gallons, :open_time, :close_time, :pressure_test, presence: true
end
