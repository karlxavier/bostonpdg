class AddEmailToVendors < ActiveRecord::Migration[5.1]
  def change
    add_column :vendors, :email, :string
  end
end

