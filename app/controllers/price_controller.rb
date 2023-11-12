class PriceController < ApplicationController
    before_action :authenticate_user!
    before_action :set_room
  
    def new
      @price = @room.price.build
    end
  
    def create
      @price = @room.price.build(price_params)
      if @price.save
        redirect_to room_path(@room), notice: 'Preço adicionado com sucesso.'
      else
        render :new
      end
    end
  
    private
  
    def set_room
      @room = Room.find(params[:room_id])
    end
  
    def price_params
      params.require(:price).permit(:start_date, :end_date, :daily_rate)
    end
end
  