class AddSenderConfirmationToTrades < ActiveRecord::Migration[6.0]
  def change
    add_column :trades, :sender_confirmation, :boolean
    add_column :trades, :recipient_confirmation, :boolean
  end
end
