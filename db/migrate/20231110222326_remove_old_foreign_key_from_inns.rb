class RemoveOldForeignKeyFromInns < ActiveRecord::Migration[7.1]
  def change
    if foreign_key_exists?(:inns, :owners)
      remove_foreign_key :inns, :owners
    end
  end

  def foreign_key_exists?(table, column)
    foreign_keys = ActiveRecord::Base.connection.foreign_keys(table)
    foreign_keys.any? { |fk| fk.column == column.to_s }
  end
end
