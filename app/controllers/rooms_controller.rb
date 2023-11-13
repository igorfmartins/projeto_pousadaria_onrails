class RoomsController < ApplicationController 
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_room, only: [:show]


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
      flash[:alert] = 'Algo deu errado, tente novamente.'
      render :new
    end
  end

  def edit
    @room
   end
 
   def update
    @room
     if @room.update(room_params)
      redirect_to @room, notice: 'Quarto atualizado com sucesso.'
     else
      flash.now[:alert] = 'Quarto não atualizado.'
      render 'edit'
     end
   end 

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name, :description, :dimension, :max_occupancy, :daily_rate, :bathroom, :balcony, :air_conditioning, :tv, :wardrobe, :safe, :accessible, :available)
  end
end
