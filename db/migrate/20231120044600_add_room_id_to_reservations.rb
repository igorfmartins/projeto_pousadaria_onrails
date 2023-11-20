class AddRoomIdToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :room, :integer
  end
end
