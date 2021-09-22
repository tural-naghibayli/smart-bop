class SafetyValveTestsController < ApplicationController

  def show
    @safety_valve_test = SafetyValveTest.find(params[:id])
  end

  def new
    @safety_valve_test = SafetyValveTest.new
    @pressure_test = PressureTest.find(params[:pressure_test_id])
  end

  def create
    @safety_valve_test = SafetyValveTest.new(safety_valve_test_params)
    @pressure_test = PressureTest.find(params[:pressure_test_id])
    @safety_valve_test.pressure_test = @pressure_test
    if @safety_valve_test.save
      redirect_to root_path, notice: "Component Pressure test successfully created."
    else
      render :new
    end
  end

  def edit
    @safety_valve_test = SafetyValveTest.find(params[:id])
  end

  def update
    if @safety_valve_test.update(safety_valve_test_params)
      redirect_to @pressure_test
    else
      render :edit
    end
  end

  def destroy
    @safety_valve_test = SafetyValveTest.find(params[:id])
    @safety_valve_test.destroy
    redirect_to bop_path
  end


  private

  def safety_valve_test_params
    params.require(:safety_valve_test).permit(:unit, :serial_number, :connection_type, :high_pressure, :low_pressure, :test_result )
  end

end
