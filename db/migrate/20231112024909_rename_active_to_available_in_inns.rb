class RenameActiveToAvailableInInns < ActiveRecord::Migration[7.1]
  def change
    rename_column :inns, :active, :available
  end
end
