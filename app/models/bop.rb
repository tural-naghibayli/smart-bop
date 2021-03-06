class Bop < ApplicationRecord
  belongs_to :rig
  validates :serial_number, :bop_type, :pressure_rating, :rig, presence: true
  has_many :pressure_tests, dependent: :destroy
  has_many :function_tests, dependent: :destroy
  has_many :safety_valve_tests, through: :pressure_tests
  has_many :component_pressure_tests, through: :pressure_tests
  has_many :component_function_tests, through: :function_tests


  def last_completed_pressure_test_date
    return "No test" if self.pressure_tests.empty?

    pressure_tests.order(:completed_date).last.completed_date
  end

  def last_completed_function_test_date
    return "No test" if self.function_tests.empty?

    function_tests.order(:completed_date).last.completed_date
  end
end
