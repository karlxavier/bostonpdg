class Admin::HotelsController < ApplicationController
    before_action :set_hotel, only: [:edit, :update, :show]

    def index
        @hotels = Hotel.all
    end

    def new
        @hotel = Hotel.new
    end

    def create
        @hotel = Hotel.new(hotel_params)

        respond_to do |format|
           if @hotel.save
                format.html { redirect_to admin_hotels_path }
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
            if @hotel.update_attributes(hotel_params)
                format.html { redirect_to admin_hotels_path }
            else
                format.html { render 'edit' }
            end
        end
    end

    private

        def hotel_params
            params.require(:hotel).permit(:name, :brand_id, :shipping_address, :address_id, :email, :notes, :contact_number)
        end

        def set_hotel
            @hotel = Hotel.find(params[:id])
        end

end
