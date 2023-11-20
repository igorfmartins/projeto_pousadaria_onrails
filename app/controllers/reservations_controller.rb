# app/controllers/reservations_controller.rb
class ReservationsController < ApplicationController
  before_action :authenticate_visitor!

  def new
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new
  end

  def create
    @room = Room.find(params[:room_id])
    @reservation = current_visitor.reservations.new(reservation_params)

    if @reservation.save
      flash[:success] = 'Reserva criada com sucesso!'
      redirect_to root_path
    else
      flash[:success] = 'Algo deu errado, tente novamente.'
      render 'new'
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :number_of_guests, :visitor_id, :room_id)
  end
  
   
end
