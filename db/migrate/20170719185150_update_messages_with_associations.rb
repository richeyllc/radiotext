class UpdateMessagesWithAssociations < ActiveRecord::Migration[5.1]
  def change
    change_table :messages do |t|
      t.references :listener, foreign_key: true
      t.references :conversation, foreign_key: true
    end
  end
end
