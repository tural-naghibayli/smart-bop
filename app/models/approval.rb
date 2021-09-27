class Approval < ApplicationRecord
  belongs_to :pressure_test
  belongs_to :user
  before_create :create_approvals

  validates :user, uniqueness: true


  def create_approvals
    self.approval_status = 'pending'
    self.testable_type = 'Right'
  end
end
