class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
      t.string :recipient
      t.decimal :amount, :scale => 2

      t.timestamps null: false
    end
  end
end
