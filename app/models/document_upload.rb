class DocumentUpload < ApplicationRecord
    has_many :document_shares
    has_many :users, through: :document_shares

    include AttachmentUploader[:attachment]
end
