class RigsController < ApplicationController
  before_action :set_rig, only: [:show]

  def show
    @rig = Rig.new
  end

  def index
    @rigs = Rig.all
  end

  private

  def set_rig
    @rig = Rig.find(params[:id])
  end
end
