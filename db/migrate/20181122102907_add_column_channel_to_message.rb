class AddColumnChannelToMessage < ActiveRecord::Migration[5.1]
  def change
    add_column :channel_users, :channel_id, :integer
  end
end
