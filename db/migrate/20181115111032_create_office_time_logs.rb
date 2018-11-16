class CreateOfficeTimeLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :office_time_logs do |t|
      t.string :name

      t.timestamps
    end

    rename_column :user_time_logs, :time_log_office_id, :office_time_log_id
  end
end
