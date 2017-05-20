class CreateContests < ActiveRecord::Migration[5.0]
  def change
    create_table :contests do |t|
      t.references :contest_type, foreign_key: true
      t.references :schedule, foreign_key: true
      t.string :name
      t.text :description
      t.string :texter_x
      t.string :texter_y
      t.string :keyword
      t.string :caller_x
      t.string :caller_y
      t.references :survey, foreign_key: true
      t.string :winner

      t.timestamps
    end
  end
end
