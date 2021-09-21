class DashboardsController < ApplicationController
  def show
    @rigs = current_user.rig
    @bop = current_user.bop
    @pressure_tests = current_user.pressure_tests
  end
end
