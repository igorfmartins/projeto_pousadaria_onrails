class HomeController < ApplicationController
    def index
        @latest_inns = Inn.order(created_at: :desc).limit(3)
        @other_inns = Inn.where.not(id: @latest_inns.map(&:id)).where(active: true).order(:brand_name)
      end

    def show
       
    end
end