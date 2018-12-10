module Admin
  class OrderUsersController < Admin::BaseController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = OrderUser.
    #     page(params[:page]).
    #     per(10)
    # end
    def new
      super
      @order_id = params[:order_id]
    end
    def create
      super
      Order.find(params[:order_user][:order_id]).update_attributes(:updated_at => DateTime.now)
    end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   OrderUser.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
