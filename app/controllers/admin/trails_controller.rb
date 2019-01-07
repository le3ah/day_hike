class Admin::TrailsController < ApplicationController
  before_action :require_admin

  def index

  end
  def show
    @trail = Trail.find(params[:id])
  end

  def destroy
    @trail = Trail.find(params[:id])
    @trail.destroy
    redirect_to trails_path
  end
end
