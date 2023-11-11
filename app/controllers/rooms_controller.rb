# app/controllers/rooms_controller.rb
class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_inn
  before_action :set_room, only: %i[show edit update]

  def index
    @rooms = @inn.rooms
  end

  def show
    # Implemente a lógica para exibir os detalhes de um quarto se necessário
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to inn_path(@inn), notice: 'Quarto adicionado com sucesso.'
    else
      render :new
    end
  end

  def edit
    # Implemente a lógica para editar um quarto se necessário
  end

  def update
    if @room.update(room_params)
      redirect_to inn_path(@inn), notice: 'Quarto atualizado com sucesso.'
    else
      render :edit
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
