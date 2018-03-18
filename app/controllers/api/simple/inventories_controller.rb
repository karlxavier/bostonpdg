module Api
  module Simple
    class InventoriesController < ApplicationController

      def list
        inventories = Inventory.all
        render json: inventories.to_json
      end
    end
  end
end
