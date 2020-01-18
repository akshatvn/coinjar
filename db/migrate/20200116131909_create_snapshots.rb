class CreateSnapshots < ActiveRecord::Migration[5.2]
  def change
    create_table :currency_snapshots, id: :integer  do |t|
      t.float :volume_24h, null: false
      t.float :volume, null: false
      t.datetime :transition_time, null: false
      t.string :status, null: false, limit: 40
      t.integer :session, null: false
      t.float :prev_close, null: false
      t.float :last, null: false
      t.datetime :current_time, null: false
      t.float :bid, null: false
      t.float :ask, null: false
      t.string :currency_code, null: false, limit: 6
      t.timestamps
    end
    add_index :currency_snapshots, [:currency_code, :created_at], name: 'idx_snapshot_cur_created'
  end

end
