class CreateBlastTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :blast_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
