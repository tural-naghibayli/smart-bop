class PressureTestsController < ApplicationController
  def show
    @pressure_test = PressureTest.find(params[:id])

  end

  def new
    @pressure_test = PressureTest.new
    @bop = Bop.find(params[:bop_id])
  end

  def create
    @pressure_test = PressureTest.new(pressure_test_params)
    @bop = Bop.find(params[:bop_id])

    @pressure_test.bop = @bop
    @pressure_test.last_test_date = @bop.last_completed_pressure_test_date


    @pressure_test.next_test_deadline = @pressure_test.completed_date + 21.day

    @pressure_test.user = current_user
    if @pressure_test.save
      redirect_to pressure_test_path(@pressure_test), notice: "Pressure test successfully created."
    else
      render :new
    end
  end

  def edit
    @pressure_test = PressureTest.find(params[:id])
  end

  def update
    if @pressure_test.update(pressure_test_params)
      redirect_to @pressure_test
    else
      render :edit
    end
  end

  def destroy
    @pressure_test = PressureTest.find(params[:id])
    @pressure_test.destroy
    redirect_to bop_path
  end


  private

  def pressure_test_params
    params.require(:pressure_test).permit(:completed_date, :test_fluid, :well_name, :serial_number_chart_recorded, :comment, :corrective_action, :drill_pipe_diameter)
  end

end
