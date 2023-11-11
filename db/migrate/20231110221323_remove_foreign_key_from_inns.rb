class RemoveForeignKeyFromInns < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :inns, column: :user_id
  end
end
