class ParksController < ApplicationController
  def index
    @parks = Park.page(params[:page]).per(10)
  end

  def show
    @park = Park.find(params[:id])
    @trees = @park.trees.page(params[:page]).per(10)
    @asset = @park.assets.page(params[:page]).per(10)
  end
end
