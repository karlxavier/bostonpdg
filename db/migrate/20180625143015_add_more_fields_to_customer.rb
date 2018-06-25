class AddMoreFieldsToCustomer < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :status, :string
    add_column :customers, :manage_by, :integer
    add_column :customers, :owned_by, :integer
    add_column :customers, :po_required, :boolean
    add_column :customers, :payment_terms, :text
    add_column :customers, :notes, :text
  end
end
