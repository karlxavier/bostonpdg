class CreateItemMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :item_messages do |t|
      t.text :body
      t.text :attachment_data
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
