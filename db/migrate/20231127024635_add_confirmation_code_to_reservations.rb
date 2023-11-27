class AddConfirmationCodeToReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :confirmation_code, :string
    add_index :reservations, :confirmation_code, unique: true
  end
end
