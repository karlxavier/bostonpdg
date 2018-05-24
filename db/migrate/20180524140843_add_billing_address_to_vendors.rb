class AddBillingAddressToVendors < ActiveRecord::Migration[5.1]
  def change
    add_column :vendors, :billing_address, :integer
  end
end
