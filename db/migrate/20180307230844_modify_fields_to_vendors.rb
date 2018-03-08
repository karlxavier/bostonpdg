class ModifyFieldsToVendors < ActiveRecord::Migration[5.1]
  def change
    remove_column :vendors, :email
    add_column :vendors, :lead_time, :integer
    add_column :vendors, :country_origin, :string
  end
end
