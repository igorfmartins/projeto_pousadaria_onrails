class AddVisitorIdToReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :visitor_id, :integer
  end
end
