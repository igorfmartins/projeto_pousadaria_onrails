class ChangeVisitorIdToGuestIdInReservations < ActiveRecord::Migration[7.1]
  def change
    rename_column :reservations, :visitor_id, :guest_id
  end    
end
