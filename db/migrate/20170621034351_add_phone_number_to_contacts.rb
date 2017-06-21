class AddPhoneNumberToContacts < ActiveRecord::Migration[5.0]
  def change
    remove_column :contacts, :phone
    add_reference :contacts, :phone_number, foreign_key: true
  end
end
