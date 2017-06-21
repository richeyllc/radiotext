class AddSmsSidToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :sms_sid, :string
  end
end
