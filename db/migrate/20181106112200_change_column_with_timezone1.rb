class ChangeColumnWithTimezone1 < ActiveRecord::Migration[5.1]
  def change
    drop_table :user_time_logs
    create_table :user_time_logs do |t|
      t.string :description
      t.datetime :time_in
      t.datetime :time_out
      t.integer :user_id
      t.integer :duration
      t.boolean :active, default: true
      t.string :ip_address

      t.timestamps
    end
  end
end
