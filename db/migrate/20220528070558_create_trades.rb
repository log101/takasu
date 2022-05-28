class CreateTrades < ActiveRecord::Migration[6.0]
  def change
    create_table :trades do |t|
      t.references :sender, null: false
      t.references :recipient, null: false
      t.boolean :confirmed

      t.timestamps
    end
  end
end
