class DashboardsController < ApplicationController
  def show
    @rigs = current_user.rig
    @bop = current_user.bop
    @pressure_tests = @bop.pressure_tests.all
    @safety_valve_tests = @bop.safety_valve_tests.all
    @component_pressure_tests = @bop.component_pressure_tests.all
    @component_function_tests = @bop.component_function_tests.all
  end
end
