class RoomsController < ApplicationController
    before_action :authenticate_owner! 
  
    def new
      @room = Room.new
    end
  
    def create
      @room = current_owner.inn.rooms.new(room_params)
      
      if @room.save
        flash[:notice] = 'Quarto cadastrado com sucesso.'
        redirect_to @room.inn
      else
        flash.now[:alert] = 'Não foi possível cadastrar o quarto.'
        render 'new'
      end
    end
  
    def edit
      @room = current_owner.inn.rooms.find(params[:id])
    end
  
    def update
      @room = current_owner.inn.rooms.find(params[:id])
  
      if @room.update(room_params)
        flash[:notice] = 'Quarto atualizado com sucesso.'
        redirect_to @room.inn
      else
        flash.now[:alert] = 'Não foi possível atualizar o quarto.'
        render 'edit'
      end
    end
  
    private
  
    def room_params
      params.require(:room).permit(
        :name, :description, :dimension, :max_occupancy, :daily_rate,
        :bathroom, :balcony, :air_conditioning, :tv, :wardrobe, :safe, :accessible, :available
      )
    end
end
  