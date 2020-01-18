class CreateCurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :currencies, id: :integer do |t|
      t.string :name, null: false, limit: 40
      t.string :code, unique: true, null: false, limit: 6
      t.float :last_last
      t.float :last_ask
      t.float :last_bid
      t.timestamps
    end
    add_index :currencies, :code, unique: true
  end
end
