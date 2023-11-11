class AddForeignKeyToInns < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :inns, :users, column: :user_id
  end
end
