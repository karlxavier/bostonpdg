class CreateCustomerEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_emails do |t|
      t.string :email
      t.integer :customer_id

      t.timestamps
    end
  end
end
