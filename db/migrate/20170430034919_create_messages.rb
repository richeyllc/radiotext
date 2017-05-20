class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references :contact, foreign_key: true
      t.references :phone_number, foreign_key: true
      t.datetime :twilio_date_created
      t.datetime :twilio_date_updated
      t.datetime :date_sent
      t.string :account_sid
      t.string :to
      t.string :from
      t.text :body
      t.string :status
      t.string :flag
      t.string :api_version
      t.string :price
      t.string :uri
      t.text :twilio_data

      t.timestamps
    end
  end
end
