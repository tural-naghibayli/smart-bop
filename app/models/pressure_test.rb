class PressureTest < ApplicationRecord
  belongs_to :user, dependent: :destroy
  validates :completed_date, :test_fluid, :well_name, :drill_pipe_diameter, :user, presence: true
end
