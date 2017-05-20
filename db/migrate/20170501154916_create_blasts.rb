class CreateBlasts < ActiveRecord::Migration[5.0]
  def change
    create_table :blasts do |t|
      t.references :blast_type, foreign_key: true
      t.references :schedule, foreign_key: true
      t.string :name
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
