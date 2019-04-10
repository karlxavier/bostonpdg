class Patients::PatientSharedFilesController < ApplicationController

     def index
          @shared_files = current_patient.patient_shared_files.all
     end

     def new
          respond_to do |format|
              format.js
          end
     end

     def create
          @shared_file = current_patient.patient_shared_files.new(doc_params)
  
          respond_to do |format|
             if @shared_file.save
                  format.html { redirect_to patients_patient_shared_files_path }
              else
                  format.html { render 'new' }
              end
          end
      end

     def show
          # @parents = @document_upload.get_parents
          # respond_to do |format|
          #     format.js
          # end
     end

     def doc_preview
          # @document = DocumentUpload.find(params[:document_upload_id])
          # respond_to do |format|
          #     format.js
          # end
     end

     private

          def doc_params
               params.require(:document_upload).permit(:notes, :attachment)
          end


end