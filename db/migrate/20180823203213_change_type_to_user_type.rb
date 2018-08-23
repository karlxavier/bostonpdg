class ChangeTypeToUserType < ActiveRecord::Migration[5.1]
  def change
    remove_column :email_template_users, :type
    add_column :email_template_users, :user_type, :string
  end
end
