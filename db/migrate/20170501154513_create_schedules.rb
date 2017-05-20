class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.references :schedule_type, foreign_key: true
      t.string :name
      t.text :description
      t.datetime :last_run
      t.datetime :next_run
      t.boolean :active
      t.string :status
      t.text :error_message

      t.timestamps
    end
  end
end
