class DashboardsController < ApplicationController
  def show
    @rigs = current_user.rig
    @bop = current_user.bop
    @presssure_tests = current_user.presssure_tests
  end
end
