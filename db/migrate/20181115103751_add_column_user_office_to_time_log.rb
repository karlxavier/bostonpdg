class AddColumnUserOfficeToTimeLog < ActiveRecord::Migration[5.1]
  def change
    add_column :user_time_logs, :time_log_office_id, :integer
  end
end
