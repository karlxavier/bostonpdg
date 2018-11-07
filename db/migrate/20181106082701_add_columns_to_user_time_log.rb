class AddColumnsToUserTimeLog < ActiveRecord::Migration[5.1]
  def change
    add_column :user_time_logs, :duration, :integer
    add_column :user_time_logs, :active, :boolean, default: true
  end
end
