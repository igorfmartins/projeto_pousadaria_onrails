class InnReservationsController < ApplicationController
    before_action :authenticate_user!
    before_action :cancel_if_not_checked_in, only: [:index]
  
    def index
      @all_my_reservations = Reservation.where(inn_id: current_user.id)
    end

    def checkin
      @reservation = Reservation.find(params[:id])
  
      if @reservation.checkin_allowed?
        @reservation.update(active_stay: true, checkin_datetime: DateTime.now)
        redirect_to my_inn_reservations_path, notice: 'Check-in realizado com sucesso!'
      else
        redirect_to my_inn_reservations_path, alert: 'Check-in não permitido para esta reserva.'
      end
    end

  private

  def cancel_if_not_checked_in
    @all_my_reservations.each do |reservation|
      if reservation.pending_checkin? && reservation.overdue_for_checkin?
        reservation.cancel
      end
    end
  end
end  