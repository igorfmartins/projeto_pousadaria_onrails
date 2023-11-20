class Visitor < ApplicationRecord
  has_many :reservations
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
