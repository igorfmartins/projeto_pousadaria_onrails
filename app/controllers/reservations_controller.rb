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
    @room
    @reservation = Reservation.new(room: @room)
    @daily = @room.daily_rate
    
  end

  def create
    @room 
    @reservation = Reservation.new(reservation_params.merge(room: @room))
    @reservation.pre_status = 'pendente'
  
    if @reservation.available?
      if @reservation.save
        redirect_to confirmation_inn_room_reservation_path(inn_id: @room.inn.id, room_id: @room.id, id: @reservation.id)
      else
        flash.now[:alert] = 'Erro ao salvar a reserva.'
        render :new
      end
    else
      flash.now[:alert] = 'Este quarto já está reservado para as datas escolhidas.'
      render :new
    end
  end

  def confirmation
    @reservation = Reservation.find(params[:id])
    @room = @reservation.room
    @inn = @room.inn
  end

  def ready
    @reservation = Reservation.find(params[:id])
    @reservation.update(pre_status: 'confirmada')
    redirect_to root_path, notice: 'Reserva confirmada com sucesso!'
  end

  def destroy
    @reservation = Reservation.find(params[:id])
  
    if @reservation.deletable?
      @reservation.destroy
      redirect_to reservations_path, notice: 'Reserva excluída com sucesso.'
    else
      redirect_to reservations_path, alert: 'Não é possível excluir a reserva nesta fase. Entre em contato com nosso contato.'
    end
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end
  
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :number_of_guests, :room_id, :guest_id)
  end
end
