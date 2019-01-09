class DocumentUploadsController < ApplicationController

    def index
        @documents = current_user.document_uploads
    end

end
  