class Admin::CustomersController < ApplicationController
    before_action :set_customer, only: [:edit, :update, :destroy, :show]

    def index
        @customers = Customer.customer_with_brands
    end

    def new
        @customer = Customer.new
    end

    def show
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

    def destroy
        @customers = Customer.customer_with_brands
        if @customer.destroy
            flash.now[:notice] = "Customer #{@customer.name} successfully deleted."
        else
            flash.now[:error] = "Cannot delete this customer which still have orders associated with it."
        end
        render action: :index
    end

    private

        def customer_params
            params.require(:customer).permit(:first_name, :last_name, :billing_address, :shipping_address, 
                                            :phone, :brand_id, :admin, :email, :status, :manage_by, :owned_by, 
                                            :po_required, :payment_terms, :notes, :website, :name, :bill_1,
                                            :bill_2, :bill_3, :bill_4, :bill_5, :ship_1, :ship_2, :ship_3,
                                            :ship_4, :ship_5, :terms, :rep, :sales_tax_code, :tax_item,
                                            :active, :fax)
        end

        def set_customer
            @customer = Customer.find(params[:id])
        end

end
