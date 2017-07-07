class CreateCompetitions < ActiveRecord::Migration[5.1]
  def change
    create_table :competitions do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :keyword
      t.string :winner
      
      t.timestamps
    end
  end
end
