# app/models/reservation.rb
class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :visitor
  validates :start_date, :end_date, :number_of_guests, presence: true

  def available?
    conflicting_reservations = room.reservations.where.not(
      "(start_date >= ? AND start_date <= ?) OR (end_date >= ? AND end_date <= ?)",
      end_date, start_date, end_date, start_date
    )
    number_of_guests_ok = conflicting_reservations.sum(:number_of_guests) + number_of_guests <= room.capacity

    !conflicting_reservations.exists? && number_of_guests_ok
  end

  def calculate_total_price(daily, start_date, end_date)
    daily * (end_date - start_date).to_i
  end

  def confirm
    update(status: 'confirmada')
  end


end
