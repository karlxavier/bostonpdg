class AddColumnIpAddressToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :ip_address, :string
  end
end
