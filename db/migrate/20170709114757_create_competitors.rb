class CreateCompetitors < ActiveRecord::Migration[5.1]
  def change
    create_table :competitors do |t|
      t.string :phone_number
      t.references :competition
      
      t.timestamps
    end
  end
end
