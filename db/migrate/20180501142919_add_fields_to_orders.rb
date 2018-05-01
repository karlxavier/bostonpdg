class AddFieldsToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :lead_time, :decimal
    add_column :orders, :total_budget, :decimal
    add_column :orders, :urgent, :boolean
  end
end
