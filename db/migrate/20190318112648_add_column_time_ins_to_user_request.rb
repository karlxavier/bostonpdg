class AddColumnTimeInsToUserRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :user_requests, :time_in, :datetime
    add_column :user_requests, :time_out, :datetime
    add_column :user_requests, :description, :string
  end
end
