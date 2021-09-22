class ComponentPressureTestsController < ApplicationController

  def show
    @component_pressure_test = ComponentPressureTest.find(params[:id])
  end

  def new
    @component_pressure_test = ComponentPressureTest.new
    @pressure_test = PressureTest.find(params[:pressure_test_id])
  end

  def create
    @component_pressure_test = ComponentPressureTest.new(component_pressure_test_params)
    @pressure_test = PressureTest.find(params[:pressure_test_id])
    @component_pressure_test.pressure_test = @pressure_test
    if @component_pressure_test.save
      redirect_to root_path, notice: "Component Pressure test successfully created."
    else
      render :new
    end
  end

  def edit
    @component_pressure_test = ComponentPressureTest.find(params[:id])
  end

  def update
    if @component_pressure_test.update(component_pressure_test_params)
      redirect_to @pressure_test
    else
      render :edit
    end
  end

  def destroy
    @component_pressure_test = ComponentPressureTest.find(params[:id])
    @component_pressure_test.destroy
    redirect_to bop_path
  end


  private

  def component_pressure_test_params
    params.require(:component_pressure_test).permit(:pressure_test_id,:bop_element_unit, :component_type, :low_pressure,
                                                    :high_pressure, :test_result, :open_gallons, :open_time,
                                                    :close_gallons, :close_time)
  end
end
