# app/models/reservation.rb
class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :visitor

  validates :start_date, :end_date, :number_of_guests, presence: true
  validate :valid_dates
  validate :valid_number_of_guests

  enum status: { pending: 'pending', ongoing: 'ongoing', canceled: 'canceled' }

  private

  def valid_dates
    errors.add(:base, 'End date must be after start date') if start_date && end_date && end_date <= start_date
  end

  def valid_number_of_guests
    errors.add(:base, 'Invalid number of guests') if room && (number_of_guests.nil? || number_of_guests > room.max_occupancy)
  end
end
