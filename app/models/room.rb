class Room < ApplicationRecord
  belongs_to :inn
  has_many :prices

  validates :name, :dimension, :bathroom, :max_occupancy, presence: true

end
