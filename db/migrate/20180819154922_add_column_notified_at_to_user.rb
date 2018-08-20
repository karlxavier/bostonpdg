class AddColumnNotifiedAtToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :last_notified, :datetime
  end
end
