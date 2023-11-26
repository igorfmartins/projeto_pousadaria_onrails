# app/controllers/reservations_controller.rb

class ReservationsController < ApplicationController
  before_action :set_room

  def pre_save
    @room 
    session[:non_user] = {
      start_date: params[:start_date],
      end_date: params[:end_date],
      number_of_guests: params[:number_of_guests]
    }
    redirect_to pre_confirmation_inn_room_reservation_path(inn_id: @room.inn.id, room_id: @room.id)
  end

  def pre_confirmation
    
    existing_reservations = Reservation.where(
    room_id: @room.id,
    start_date: session[:non_user][:start_date],
    end_date: session[:non_user][:end_date]
    )

    if existing_reservations.empty?
      flash.now[:alert] = 'Este quarto esta livre para as datas escolhidas.'
      render
      
    else
      flash.now[:alert] = 'Este quarto já está reservado para as datas escolhidas.'
      render 'pre_save'
    end
  end

  
  def new
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new(room: @room)
    @daily = @room.daily_rate
    
  end

  def create
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new(reservation_params.merge(room: @room))
  
    existing_reservations = Reservation.where(
      room_id: @room.id,
      start_date: @reservation.start_date..@reservation.end_date,
      end_date: @reservation.start_date..@reservation.end_date
    )
  
    if existing_reservations.empty?
      redirect_to confirmation_inn_room_reservation_path(inn_id: @room.inn.id, room_id: @room.id, id: @reservation.id)
    elsif existing_reservations.present?
      flash.now[:alert] = 'Este quarto já está reservado para as datas escolhidas.'
      render 'new'
    else
      render 'new'
    end
    
  

 

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :number_of_guests)
  end
  

end
