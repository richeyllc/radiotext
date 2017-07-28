class AddCategoryToCompetitions < ActiveRecord::Migration[5.1]
  def change
    change_table :competitions do |t|
      t.string :category
    end
  end
end
