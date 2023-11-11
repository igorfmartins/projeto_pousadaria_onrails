class AddForeignKeyToInnsAgain < ActiveRecord::Migration[7.1]
  def change
    remove_column :inns, :user_id, :integer if column_exists?(:inns, :user_id)

    add_reference :inns, :user, null: false, foreign_key: true
  end

  def column_exists?(table, column)
    ActiveRecord::Base.connection.column_exists?(table, column)
  end
end
