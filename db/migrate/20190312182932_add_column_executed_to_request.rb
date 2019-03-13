class AddColumnExecutedToRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :user_requests, :executed, :boolean, default: false
  end
end
