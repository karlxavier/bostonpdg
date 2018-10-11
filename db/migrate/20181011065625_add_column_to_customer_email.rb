class AddColumnToCustomerEmail < ActiveRecord::Migration[5.1]
  def change
    add_column :customer_emails, :primary, :boolean, default: false
  end
end
