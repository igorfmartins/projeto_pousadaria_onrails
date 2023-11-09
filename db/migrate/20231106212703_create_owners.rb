class CreateOwners < ActiveRecord::Migration[7.1]
  def change
    create_table :owners do |t|
      t.string :owner_name
      t.string :social_name
      t.string :gender
      t.string :pronouns
      t.integer :age
      t.integer :tax_id
      t.integer :id_number
      t.string :address
      t.string :city
      t.string :state
      t.integer :phone
      t.string :email

      t.timestamps
    end
  end
end
