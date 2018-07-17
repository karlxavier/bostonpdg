class CreateDefaultAttributes < ActiveRecord::Migration[5.1]
  def change
    create_table :default_attributes do |t|
      t.string :field_name
      t.string :field_id
      t.string :description
      t.string :type
      t.integer :user_id

      t.timestamps
    end
  end
end
