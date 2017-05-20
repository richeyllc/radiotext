class CreateSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :surveys do |t|
      t.string :name
      t.text :description
      t.references :schedule, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
