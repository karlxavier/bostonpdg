class Admin::OfficesController < Admin::BaseController
     before_action :set_office, only: [:edit, :update, :show, :destroy]

     def index
          @offices = Office.all
      end
  
      def new
          @office = Office.new
      end
  
      def create
          @office = Office.new(office_params)
  
          respond_to do |format|
             if @office.save
                format.html { redirect_to admin_offices_path }
              else
                  format.html { render 'new' }
              end
          end
      end
  
      def edit
      end
  
      def show
      end
  
      def update
          respond_to do |format|
              if @office.update_attributes(office_params)
                  format.html { redirect_to admin_offices_path }
              else
                  format.html { render 'edit' }
              end
          end
      end
  
      def destroy
          if @office.destroy
              flash.now[:notice] = "Office #{@office.full_name} successfully deleted."
          else
              flash.now[:error] = "Cannot delete this office, associations still exist."
          end
          render action: :index
      end
  
      private
  
          def office_params
              params.require(:office).permit(:name)
          end
  
          def set_office
              @office = Office.find(params[:id])
          end
  
end