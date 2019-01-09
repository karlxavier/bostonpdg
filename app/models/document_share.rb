class DocumentShare < ApplicationRecord
    belongs_to :user
    belongs_to :document_upload
end
