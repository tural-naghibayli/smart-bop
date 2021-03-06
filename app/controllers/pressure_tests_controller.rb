class PressureTestsController < ApplicationController
  before_action :set_pressure_test, only: [:show, :edit, :update, :destroy, :approve]

  def index
    @pressure_tests = PressureTest.all
  end

  def preview
    @pressure_test = PressureTest.find(params[:format])
  end

  def show
    @approval = Approval.find_by(user: current_user, pressure_test: @pressure_test)
  end

  def new
    @pressure_test = PressureTest.new
    @bop = Bop.find(params[:bop_id])

    Question.all.each do |q|
      @pressure_test.answers.build
    end

    @pressure_test.approvals.build
  end

  def create
    @pressure_test = PressureTest.new(pressure_test_params)
    @bop = Bop.find(params[:bop_id])

    @pressure_test.bop = @bop
    @pressure_test.last_test_date = @bop.last_completed_pressure_test_date

    @pressure_test.next_test_deadline = @pressure_test.completed_date + 21.day
    @pressure_test.user = current_user
    if @pressure_test.save
      @pressure_test.answers.build
      redirect_to pressure_test_path(@pressure_test), notice: "Pressure test successfully created."
    else
      render :new
    end
  end

  def preview
    @pressure_test = PressureTest.find(params[:format])
  end

  def edit

  end

  def approve
    @approve = Approval.find_by(user: current_user, pressure_test: @pressure_test)
    @approve.approval_status = "Approved"
    @approve.save
    redirect_to @pressure_test
  end

  def update
    if @pressure_test.update(pressure_test_params)
      redirect_to @pressure_test, notice: 'Pressure test updated.'
    else
      render :edit
    end
  end

  def destroy
    @pressure_test.destroy
    redirect_to bop_path
  end

  private

  def pressure_test_params

    params.require(:pressure_test).permit(:completed_date, :test_fluid, :well_name, :serial_number_chart_recorded, :comment, :corrective_action, :drill_pipe_diameter, :photo, :report_file, :location,
                                          component_pressure_tests_attributes:[:id, :pressure_test_id,:bop_element_unit, :component_type, :low_pressure,
                                                                               :high_pressure, :test_result, :open_gallons, :open_time,
                                                                               :close_gallons, :close_time, :photo, :_destroy],
                                          safety_valve_tests_attributes:[:id, :unit, :serial_number, :connection_type, :high_pressure, :low_pressure, :test_result, :_destroy],
                                          answers_attributes: [:question_id, :value],
                                          approvals_attributes: [:id, :testable_type, :approval_status, :pressure_test_id, :user_id])
  end

  def set_pressure_test
    @pressure_test = PressureTest.find(params[:id])
  end

end
