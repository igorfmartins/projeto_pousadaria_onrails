class AddCheckinToReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :active_stay, :boolean, default: false
    add_column :reservations, :checkin_datetime, :datetime
  end
end
