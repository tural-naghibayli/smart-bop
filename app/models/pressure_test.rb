class PressureTest < ApplicationRecord
  belongs_to :user
  belongs_to :bop

  has_many :component_pressure_tests, dependent: :destroy
  accepts_nested_attributes_for :component_pressure_tests, reject_if: :all_blank, allow_destroy: true

  has_many :safety_valve_tests, dependent: :destroy
  accepts_nested_attributes_for :safety_valve_tests, reject_if: :all_blank, allow_destroy: true

  has_many :approvals, dependent: :destroy
  has_many :answers, dependent: :destroy

  validates :completed_date, :test_fluid, :well_name, :drill_pipe_diameter, :user, presence: true
  after_create :create_approvals

  def create_approvals
    users = bop.rig.users
    users.each do |user|
      if user.position == 'Driller' || user.position == 'Shift Supervisor' || user.position == 'Well Site Leader' || user.position == 'Rig Superintendent'
        Approval.create(user: user, pressure_test: self, testable_type: "right", approval_status: "pending")
      end
    end
  end
end
