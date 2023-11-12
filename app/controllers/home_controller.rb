class HomeController < ApplicationController
    def index     
       @inns = Inn.all.includes(:rooms).where(active: true)
    end

    def show
       
    end
end