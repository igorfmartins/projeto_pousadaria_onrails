class ChangeOwnerReferenceToUserReferenceInInns < ActiveRecord::Migration[7.1]
  def change
    rename_column :inns, :owner_id, :user_id
    rename_index :inns, 'index_inns_on_owner_id', 'index_inns_on_user_id'
  end
end
