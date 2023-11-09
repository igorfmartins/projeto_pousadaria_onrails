class Inn < ApplicationRecord
  belongs_to :owner
  validates :brand_name, :corporate_name, :cnpj, :contact_phone, :email, :full_address, :state, :city, :zip_code, :description, :rooms_max, :accessibility, :policies, :payment_methods, :check_in_time, :check_out_time, :active, presence: true
end
