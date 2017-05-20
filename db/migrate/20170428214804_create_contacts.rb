class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :phone
      t.integer :age
      t.date :birthdate
      t.boolean :opt_in_a
      t.boolean :opt_in_b
      t.boolean :opt_in_c
      t.boolean :confirmed_number
      t.text :notes

      t.timestamps
    end
  end
end
