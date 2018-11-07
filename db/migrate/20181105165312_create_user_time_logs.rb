class CreateUserTimeLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :user_time_logs do |t|
      t.string :description
      t.time :time_in
      t.time :time_out
      t.integer :user_id
      t.string :ip_address

      t.timestamps
    end
  end
end
