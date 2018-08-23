class CreateEmailTemplateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :email_template_users do |t|
      t.integer :email_template_id
      t.integer :user_id
      t.string :email
      t.string :type

      t.timestamps
    end
  end
end
