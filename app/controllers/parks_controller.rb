class ParksController < ApplicationController
  def index
    @parks = Park.page(params[:page]).per(12)
  end

  def show
    @park = Park.find(params[:id])
    @trees = @park.trees.page(params[:page]).per(12)
    @assets = @park.assets.page(params[:page]).per(12)
  end

  def search
    if params[:park_id].present?
      @parks = Park.where(park: params[:park_id]).where("park_name LIKE ?", "%#{params[:query]}%")
    else
      @parks = Park.where("park_name LIKE ?", "%#{params[:query]}%")
    end
  end
end
