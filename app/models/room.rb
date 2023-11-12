class Room < ApplicationRecord
  belongs_to :inn
  has_many :prices
end
