class ChangeRoomTypeInReservations < ActiveRecord::Migration[7.1]
  def change
    change_column :reservations, :room, :string
  end
  
end
