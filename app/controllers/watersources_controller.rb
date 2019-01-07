class WatersourcesController < ApplicationController
  def index
    @trail = Trail.find(params[:trail_id])
  end

  def show
    @watersource = Watersource.find(params[:id])
  end
end
