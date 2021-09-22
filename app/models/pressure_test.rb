class PressureTest < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :bop

  has_many :component_pressure_tests, dependent: :destroy
  accepts_nested_attributes_for :component_pressure_tests, reject_if: :all_blank, allow_destroy: true

  has_many :safety_valve_tests, dependent: :destroy
  accepts_nested_attributes_for :safety_valve_tests, reject_if: :all_blank, allow_destroy: true

  validates :completed_date, :test_fluid, :well_name, :drill_pipe_diameter, :user, presence: true
end
