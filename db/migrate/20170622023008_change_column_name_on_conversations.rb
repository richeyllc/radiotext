class ChangeColumnNameOnConversations < ActiveRecord::Migration[5.0]
  def change
    rename_column :conversations, :to_number_id, :my_number_id
  end
end
