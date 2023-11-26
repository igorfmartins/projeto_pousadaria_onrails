class RenameVisitorsToGuests < ActiveRecord::Migration[7.1]
  def change
    rename_table :visitors, :guests
  end
end
