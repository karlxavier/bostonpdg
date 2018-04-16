class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :created_by
      t.string :status
      t.integer :customer
      t.integer :delivery_address
      t.integer :payment_address
      t.decimal :total_cost
      t.decimal :total_tax
      t.decimal :total_discount
      t.decimal :margin
      t.integer :last_updated_by
      t.timestamp :promise_date
      t.string :notes
      t.timestamp :fulfillment_date

      t.timestamps
    end
  end
end
