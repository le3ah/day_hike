class TrailsController < ApplicationController
  def show
    @trail = Trail.find(params[:id])
  end
  def index
    @trails = Trail.all
  end
end
