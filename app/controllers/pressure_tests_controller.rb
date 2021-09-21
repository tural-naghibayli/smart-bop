class PressureTestsController < ApplicationController
  def show
    @pressure_test = Pressure_test.find(params[:id])
  end

  def new
    @pressure_test = Pressure_test.new
  end

  def create
    @pressure_test = Pressure_test.new(pressure_test_params)
    @pressure_test.user = current_user
    if @pressure_test.save
      redirect_to bop_path, notice: "Pressure test successfully created."
    else
      render :new
    end
  end

  def edit
    @pressure_test = Pressure_test.find(params[:id])
  end

  def update
    if @pressure_test.update(pressure_test_params)
      redirect_to @pressure_test
    else
      render :edit
    end
  end

  def destroy
    @pressure_test = Pressure_test.find(params[:id])
    @pressure_test.destroy
    redirect_to bop_path
  end


  private

  def pressure_test_params
    params.require(:pressure_test).permit(:last_test_date, :completed_date, :next_test_deadline, :test_fluid, :well_name, :serial_number_chart_recording, :comment, :corrective_action, :drill_pipe_diameter)
  end

end
