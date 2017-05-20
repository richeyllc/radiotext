class CreatePhoneNumbers < ActiveRecord::Migration[5.0]
  def change
    create_table :phone_numbers do |t|
      t.string :number
      t.text :description

      t.timestamps
    end
  end
end
