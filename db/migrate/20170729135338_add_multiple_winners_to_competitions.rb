class AddMultipleWinnersToCompetitions < ActiveRecord::Migration[5.1]
  def change
    change_table :competitions do |t|
      t.string :second_winner
      t.string :third_winner
      t.string :fourth_winner
      t.string :fifth_winner
    end
  end
end
