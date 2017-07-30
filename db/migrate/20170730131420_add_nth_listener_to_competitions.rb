class AddNthListenerToCompetitions < ActiveRecord::Migration[5.1]
  def change
    change_table :competitions do |t|
      t.integer :nth_listener
    end
  end
end
