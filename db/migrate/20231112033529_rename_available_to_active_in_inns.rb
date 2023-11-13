class RenameAvailableToActiveInInns < ActiveRecord::Migration[7.1]
  def change
    rename_column :inns, :available, :active
  end
end
