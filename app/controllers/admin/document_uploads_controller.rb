class Admin::DocumentUploadsController < Admin::BaseController
    before_action :set_document, only: [:edit, :update]

    def index
        @document_uploads = DocumentUpload.all
    end

    def new
        @document_upload = DocumentUpload.new
    end

    def create
        @document_upload = DocumentUpload.new(doc_params)

        respond_to do |format|
           if @document_upload.save
                format.html { redirect_to admin_document_uploads_path }
            else
                format.html { render 'new' }
            end
        end
    end

    def edit
    end

    def update
        respond_to do |format|
            if @document_upload.update_attributes(doc_params)
                format.html { redirect_to admin_document_uploads_path }
            else
                format.html { render 'edit' }
            end
        end
    end

    private

        def doc_params
            params.require(:document_upload).permit(:description, :attachment, user_ids: [])
        end

        def set_document
            @document_upload = DocumentUpload.find(params[:id])
        end
    

end
