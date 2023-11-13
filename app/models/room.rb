class Room < ApplicationRecord
  belongs_to :inn
  has_many :prices

  validates :name, :dimension, :daily_rate, :bathroom, presence: true

end
