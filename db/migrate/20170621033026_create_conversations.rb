class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.references :to_number, index: true, foreign_key: { to_table: :phone_numbers }
      t.references :from_number, index: true, foreign_key: { to_table: :phone_numbers }
      t.datetime :seen_at
      t.datetime :deleted_at
      t.text :notes

      t.timestamps
    end
  end
end
