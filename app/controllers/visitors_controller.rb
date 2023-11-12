class VisitorsController < ApplicationController
    def index
      @recent_inns = Inn.order(created_at: :desc).limit(3)
      @other_inns = Inn.where(active: true).offset(3)
    end
  
    def show
      @inn = Inn.find(params[:id])
    end
  end
  