class CreateMyNumbers < ActiveRecord::Migration[5.0]
  def change
    create_table :my_numbers do |t|
      t.string :name
      t.references :phone_number, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
