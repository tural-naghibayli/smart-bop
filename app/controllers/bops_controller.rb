class BopsController < ApplicationController
  def index
    @bops = Bop.all
  end

  def show
    @bop = Bop.find(params[:id])
  end

  def new
    @bop = Bop.new
  end
end
