class Bop < ApplicationRecord
  belongs_to :rig
  validates :serial_number, :bop_type, :pressure_rating, :rig, presence: true
  has_many :pressure_tests

  def last_completed_pressure_test_date
    return Date.today if pressure_tests.empty?

    pressure_tests.order(:completed_date).last.completed_date
  end
end
