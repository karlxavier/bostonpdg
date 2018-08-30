class OrderEntryAttachment < ApplicationRecord
  has_attached_file :attachment_file
  do_not_validate_attachment_file_type :attachment_file

  def attachment_url
    self.attachment.url
  end
end
