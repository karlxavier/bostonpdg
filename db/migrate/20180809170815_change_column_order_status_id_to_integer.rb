class ChangeColumnOrderStatusIdToInteger < ActiveRecord::Migration[5.1]
  def change
  	change_column :orders, :order_status_id, 'integer USING CAST(order_status_id AS integer)'
  end
end
