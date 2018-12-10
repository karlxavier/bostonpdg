class Admin::InventoriesController < Admin::BaseController
    before_action :set_inventory, only: [:edit, :update]

    def index
        @inventories = Inventory.inventory_with_products
    end

    def new
        @inventory = Inventory.new
    end

    def create
        @inventory = Inventory.new(inventory_params)

        respond_to do |format|
           if @inventory.save
                format.html { redirect_to admin_inventories_path }
            else
                format.html { render 'new' }
            end
        end
    end

    def edit
    end

    def update
        respond_to do |format|
            if @inventory.update_attributes(inventory_params)
                format.html { redirect_to admin_inventories_path }
            else
                format.html { render 'edit' }
            end
        end
    end

    def import_csv
        Inventory.import(params[:file])
        redirect_to admin_inventories_path
    end

    private

        def inventory_params
            params.require(:inventory).permit(:loc_id, :bin_id, :quantity, :aisle_id, :product_id, :hotel_id, :cartons)
        end

        def set_inventory
            @inventory = Inventory.find(params[:id])
        end

end

