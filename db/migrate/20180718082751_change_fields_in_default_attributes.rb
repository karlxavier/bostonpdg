class ChangeFieldsInDefaultAttributes < ActiveRecord::Migration[5.1]
  def change
    remove_column :default_attributes, :type
    remove_column :default_attributes, :field_id
    add_column :default_attributes, :input_type, :string
  end
end
