class AddInnIdToReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :inn_id, :integer
  end
end
