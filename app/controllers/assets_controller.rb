class AssetsController < ApplicationController
  def index
    @assets = Asset.page(params[:page]).per(10)
  end

  def show
    @asset = Asset.find(params[:id])
  end
end
