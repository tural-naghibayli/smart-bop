class SafetyValveTest < ApplicationRecord
  belongs_to :pressure_test
  validates :unit, :connection_type, :high_pressure, :low_pressure, :test_result, presence: true
end
