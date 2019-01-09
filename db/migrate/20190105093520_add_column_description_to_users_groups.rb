class AddColumnDescriptionToUsersGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :users_groups, :description, :string
  end
end
