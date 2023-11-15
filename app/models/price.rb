class Price < ApplicationRecord
  belongs_to :room

  validates :start_date, :end_date, :daily_rate, presence: true
  validate :no_date_overlap

  private

  def no_date_overlap
    if room.prices.where.not(id: id).exists?(['(start_date <= ? AND end_date >= ?) OR (start_date >= ? AND start_date <= ?)', start_date, start_date, start_date, end_date])
      errors.add(:base, 'Ja existe um preço personalizado para essa data. Escolha outra data.')
    end
  end
end