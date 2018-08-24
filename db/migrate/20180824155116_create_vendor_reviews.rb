class CreateVendorReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :vendor_reviews do |t|
      t.text :review
      t.integer :vendor_id
      t.integer :user_id

      t.timestamps
    end
  end
end
