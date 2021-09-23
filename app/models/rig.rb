class Rig < ApplicationRecord
  has_many :users
  has_one :bop, dependent: :destroy
  validates :name, :reservoir_field, :contractor_drilling_company, :operator_company, presence: true
end
