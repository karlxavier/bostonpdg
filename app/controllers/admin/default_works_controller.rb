class Admin::DefaultWorksController < Admin::BaseController
    before_action :set_default_work, only: [:edit, :update, :show, :destroy]

    def index
        @default_works = DefaultWork.all
    end

    def new
        @default_work = DefaultWork.new
    end

    def create
        @default_work = DefaultWork.new(default_works_params)

        respond_to do |format|
           if @default_work.save
                format.html { redirect_to admin_default_works_path }
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
            if @default_work.update_attributes(default_works_params)
                format.html { redirect_to admin_default_works_path }
            else
                format.html { render 'edit' }
            end
        end
    end

    def destroy
        @default_works = DefaultWork.all
        if @default_work.destroy
            flash.now[:notice] = "work successfully deleted."
        else
            flash.now[:error] = "Cannot delete this hotel, associations still exist."
        end
        render action: :index
    end

    private

        def default_works_params
            params.require(:default_work).permit(:description)
        end

        def set_default_work
            @default_work = DefaultWork.find(params[:id])
        end

end
