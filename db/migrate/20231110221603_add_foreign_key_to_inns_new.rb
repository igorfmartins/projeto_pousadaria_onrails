class AddForeignKeyToInnsNew < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :inns, :users
  end
end

