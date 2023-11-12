class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_inn
  before_action :set_room, only: %i[show edit update]

  def index
    @rooms = @inn.rooms
  end

  def show
    
  end

  def new
    @room = Room.new
  end  

  def create
    @room = current_user.inn.rooms.build(room_params)
    if @room.save
      redirect_to inn_path(current_user.inn), notice: 'Quarto adicionado com sucesso.'
    else
      flash.now[:alert] = 'Algo deu errado, tente novamente.'
      render :new
    end
  end

  def edit
    @room = Room.find(params[:id])
   end
 
   def update
    @room = Room.find(params[:id])
     if @room.update(room_params)
      redirect_to @inn, notice: 'Quarto atualizado com sucesso.'
     else
      flash.now[:alert] = 'Qaurto não atualizado.'
      render 'edit'
     end
   end 

  private

  def set_inn
    @inn = Inn.find(params[:inn_id])
  end

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name, :description, :dimension, :max_occupancy, :daily_rate, :bathroom, :balcony, :air_conditioning, :tv, :wardrobe, :safe, :accessible, :available)
  end
end
