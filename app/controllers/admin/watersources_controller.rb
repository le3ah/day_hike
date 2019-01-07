class Admin::WatersourcesController < ApplicationController
  before_action :require_admin

  def index
    @trail = Trail.find(params[:trail_id])
  end
end
