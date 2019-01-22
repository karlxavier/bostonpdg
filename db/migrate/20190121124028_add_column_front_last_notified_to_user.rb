class AddColumnFrontLastNotifiedToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :front_last_notified, :datetime, default: Time.now
  end
end
