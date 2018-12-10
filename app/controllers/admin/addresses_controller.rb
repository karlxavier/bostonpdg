class Admin::AddressesController < Admin::BaseController
    before_action :set_address, only: [:edit, :update]

    def index
        @addresses = Address.all
    end

    def edit
    end 

    def update
        respond_to do |format|
            if @address.update_attributes(address_params)
                format.html { redirect_to admin_addresses_path }
            else
                format.html { render 'edit' }
            end
        end
    end

    def new
        @address = Address.new
    end

    def create
        @address = Address.new(address_params)

        respond_to do |format|
           if @address.save
                format.html { redirect_to admin_addresses_path }
            else
                format.html { render 'new' }
            end
        end
    end

    private

        def address_params
            params.require(:address).permit(:street, :street_2, :city, :state, :zip, :country)
        end

        def set_address
            @address = Address.find(params[:id])
        end


end
