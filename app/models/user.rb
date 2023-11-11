class User < ApplicationRecord
  has_one :inn

  def has_inn?
    inn.present?
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable  
end

