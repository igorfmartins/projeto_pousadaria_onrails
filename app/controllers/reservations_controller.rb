# app/controllers/reservations_controller.rb
class ReservationsController < ApplicationController
  before_action :authenticate_visitor!, only: [:new, :create]
  before_action :set_room, only: [:new, :create]

  def show
    @all_reservations = Reservation.all
  end

  def new
    @reservation = Reservations.new
  end

  def create
    @reservation = Reservation.new(reservation_params.merge(room: @room))

    if @reservation.save
      flash[:success] = 'Reserva criada com sucesso!'
      redirect_to root_path
    else
      flash[:error] = 'Algo deu errado, tente novamente.'
      render 'new'
    end
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :number_of_guests)
  end
end
