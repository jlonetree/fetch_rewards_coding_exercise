class CreateTransactionRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :transaction_records do |t|
      t.string :payer
      t.integer :points
      t.date :timestamp

      t.timestamps
    end
  end
end
