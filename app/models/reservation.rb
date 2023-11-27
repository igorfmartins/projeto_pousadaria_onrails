class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :guest
  validates :start_date, :end_date, :number_of_guests, presence: true
  
  def available?
    conflicting_reservations = room.reservations.where(
      "(start_date < ? AND end_date > ?) OR (start_date < ? AND end_date > ?)",
      end_date, start_date, start_date, end_date
    )  
    number_of_guests_ok = conflicting_reservations.sum(:number_of_guests) + number_of_guests <= room.max_occupancy
    
    !conflicting_reservations.exists? && number_of_guests_ok
  end
  
  def self.delete_pending_reservations
    pending_reservations = where(pre_status: 'pendente')
    
    pending_reservations.each do |reservation|
      if reservation.start_date - 7.days <= Date.current
        reservation.destroy
      end
    end
  end

  def deletable?
    confirmed? && start_date - 7.days > Date.current
  end

  private

  def confirmed?
    pre_status == 'confirmada'
  end
  
end
