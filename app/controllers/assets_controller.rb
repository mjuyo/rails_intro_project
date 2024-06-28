class AssetsController < ApplicationController
  def index
    @assets = Asset.page(params[:page]).per(12)
  end

  def show
    @asset = Asset.find(params[:id])
  end
end
