class Admin::CustomersController < ApplicationController
    before_action :set_customer, only: [:edit, :update]

    def index
        @customers = Customer.all
    end

    def new
        @customer = Customer.new
    end

    def create
        @customer = Customer.new(customer_params)

        respond_to do |format|
           if @customer.save
                format.html { redirect_to admin_customers_path }
            else
                format.html { render 'new' }
            end
        end
    end

    def edit
    end

    def update
        respond_to do |format|
            if @customer.update_attributes(customer_params)
                format.html { redirect_to admin_customers_path }
            else
                format.html { render 'edit' }
            end
        end
    end

    private

        def customer_params
            params.require(:customer).permit(:first_name, :last_name, :billing_address, :shipping_address, 
                                            :phone, :brand_id, :admin, :email, :status, :manage_by, :owned_by, 
                                            :po_required, :payment_terms, :notes, :website)
        end

        def set_customer
            @customer = Customer.find(params[:id])
        end

end
