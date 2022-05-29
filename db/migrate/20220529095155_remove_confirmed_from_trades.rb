class RemoveConfirmedFromTrades < ActiveRecord::Migration[6.0]
  def change
    remove_column :trades, :confirmed, :boolean
  end
end
