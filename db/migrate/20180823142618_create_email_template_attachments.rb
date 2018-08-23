class CreateEmailTemplateAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :email_template_attachments do |t|
      t.integer :email_template_id
      t.attachment :attachment_file

      t.timestamps
    end
  end
end
