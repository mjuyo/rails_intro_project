class ParksController < ApplicationController
  def index
    @parks = Park.page(params[:page]).per(12)
  end

  def show
    @park = Park.find(params[:id])
    @trees = @park.trees.page(params[:page]).per(12)
    @asset = @park.assets.page(params[:page]).per(12)
  end
end
