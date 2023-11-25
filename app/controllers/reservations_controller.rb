# app/controllers/reservations_controller.rb
class ReservationsController < ApplicationController
  before_action :authenticate_visitor!, only: [:new, :create]
  before_action :set_room, only: [:new, :create, :confirmation]

  def show
    @all_reservations = Reservation.all
  end

  def new
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new(room: @room) 
    @daily = @room.daily_rate
  end
  
  def create    
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.pre_status = 'pendente'
    @reservation.visitor = current_visitor 
    if @reservation.save
      redirect_to confirmation_room_reservation_path(id: @reservation.id)
    else
      flash.now[:error] = 'Algo deu errado, tente novamente.'
      render 'new'
    end
  end

  def confirmation
    @daily = @room.daily_rate
    @reservation = Reservation.find(params[:id])
    
  end

  def edit
    @inn = Inn.find(params[:id])
    @reservation = Reservation.find(params[:id])
   end
 
   def update
     @inn = Inn.find(params[:id])
     if @reservation.update(status: 'confirmada')
      redirect_to root_path, notice: 'Reserva confirmada com sucesso!'
     else
      flash.now[:alert] = 'Reserva ainda não confirmada.'
      render 'confimation'
     end
   end 

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :number_of_guests, :visitor_id, :room_id)
  end
end
