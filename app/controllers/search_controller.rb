class SearchController < ApplicationController
    def index
        @parks = Park.all

        if params[:query].present?
            @parks = @parks.where('park_name LIKE :query OR location LIKE :query OR nbhd LIKE :query', query: "%#{params[:query]}%")
        end

        if params[:nbhd].present?
            @parks = @parks.where(nbhd: params[:nbhd])
        end

        @parks = @parks.page(params[:page]).per(12)
    end
end
