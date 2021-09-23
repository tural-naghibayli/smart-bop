class SafetyValveTest < ApplicationRecord
  belongs_to :pressure_test, dependent: :destroy

  validates :unit, :connection_type, :high_pressure, :low_pressure, :test_result, presence: true
end
