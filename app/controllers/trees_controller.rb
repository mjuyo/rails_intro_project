class TreesController < ApplicationController
  def index
    @trees = Tree.page(params[:page]).per(12)
  end

  def show
    @tree = Tree.find(params[:id])
  end

  def search
    if params[:park_id].present?
      @trees = Tree.where(park: params[:park_id]).where("common LIKE ?", "%#{params[:query]}%")
    else
      @trees = Tree.where("common LIKE ?", "%#{params[:query]}%")
    end
  end
end
