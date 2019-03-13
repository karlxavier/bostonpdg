class RenameColumnTypeToRequestType < ActiveRecord::Migration[5.1]
  def change
    rename_column :user_requests, :type, :request_type
  end
end
