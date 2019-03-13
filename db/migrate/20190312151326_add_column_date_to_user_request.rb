class AddColumnDateToUserRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :user_requests, :date, :datetime
  end
end
