class TreesController < ApplicationController
  def index
    @trees = Tree.page(params[:page]).per(12)
  end

  def show
    @tree = Tree.find(params[:id])
  end


end
