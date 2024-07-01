class AssetsController < ApplicationController
  def index
    @assets = Asset.page(params[:page]).per(12)
  end

  def show
    @asset = Asset.find(params[:id])
    @park = Park.find_by(park_name: @asset.park_name)
  end
end
