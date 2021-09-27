class ApprovalsController < ApplicationController
  def show
    @approval = Approval.find(params[:id])
  end

  def new
    @approval = Approval.new
    @pressure_test = PressureTest.find(params[:pressure_test_id])
  end

  def create
    @approval = Approval.new(approval_params)
    @pressure_test = PressureTest.find(params[:pressure_test_id])
    @approval.pressure_test = @pressure_test
    @approval.approval_status = 'Pending'
    @approval.testable_type = 'Right'
    raise
    @approval.save
  end

  private

  def approval_params
    params.require(:approval).permit(:pressure_test_id, :user)
  end

end
