class AddDateSeenToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :date_seen, :datetime
  end
end
