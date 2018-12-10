module Admin
  class OrderBranchesController < Admin::BaseController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = OrderBranch.
    #     page(params[:page]).
    #     per(10)
    # end
    def new
      super
      @order_id = params[:order_id]
      @brand_id = params[:brand_id]
    end


    def create
      order_branch = OrderBranch.new
      order_branch.order_id = params[:order_branch][:order_id]
      order_branch.brand_id = params[:order_branch][:brand_id]
      order_branch.address_id = params[:order_branch][:address_id]
      if order_branch.save
        order = Order.find(params[:order_branch][:order_id])
        order.update_attributes(:updated_at => DateTime.now)
        redirect_to admin_order_path(order)
      end
    end

    def destroy
      order_branch = OrderBranch.find(params[:id])
      if order_branch.destroy
        order = Order.find(order_branch.order_id)
        order.update_attributes(:updated_at => DateTime.now)
        redirect_to admin_order_path(order)
      end
    end
    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   OrderBranch.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
