class AddStatusToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :pre_status, :string
  end
end
