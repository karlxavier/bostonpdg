class AddStatusToOrderEntry < ActiveRecord::Migration[5.1]
  def change
    add_column :order_entries, :status, :string
  end
end
