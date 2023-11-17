class Inn < ApplicationRecord
  belongs_to :user
  has_many :rooms, dependent: :restrict_with_error
  validates :brand_name, :corporate_name, :contact_phone, :full_address, :cnpj, presence: true

  def self.search(term)
    if term
      where('brand_name LIKE ? OR city LIKE ?', "%#{term}%", "%#{term}%").order(:brand_name)
    else
      all.order(:brand_name)
    end
  end

end
