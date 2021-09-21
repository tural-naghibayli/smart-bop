class Bop < ApplicationRecord
  belongs_to :rig
  validates :serial_number, :bop_type, :pressure_rating, :rig, presence: true
end
