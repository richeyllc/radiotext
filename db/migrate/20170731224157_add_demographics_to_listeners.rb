class AddDemographicsToListeners < ActiveRecord::Migration[5.1]
  def change
    change_table :listeners do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :age
      t.string :date_of_birth
      t.string :notes
    end
  end
end
