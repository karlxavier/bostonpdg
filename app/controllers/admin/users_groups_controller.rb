module Admin
  class UsersGroupsController < Admin::BaseController
    before_action :set_users_group, only: [:edit, :update, :destroy]

    def index
      @users_groups = UsersGroup.all
    end

    def new
      @users_group = UsersGroup.new
    end

    def create
      @users_group = UsersGroup.new(users_group_params)

      respond_to do |format|
        if @users_group.save
             format.html { redirect_to admin_users_groups_path }
         else
             format.html { render 'new' }
         end
      end
    end

    def edit
    end

    def update
      respond_to do |format|

        if @users_group.update_attributes(users_group_params)
            format.html { redirect_to admin_users_groups_path }
        else
            format.html { render 'edit' }
        end
      end
    end

    def group_assign
      @user = User.find(params[:user_id])
      @users_groups = UsersGroup.all
      respond_to do |format|
        format.js
      end
    end

    private

      def users_group_params
        params.require(:users_group).permit(:user_id, :description)
      end

      def set_users_group
        @users_group = UsersGroup.find(params[:id])
      end
    

    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = UsersGroup.
    #     page(params[:page]).
    #     per(10)
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   UsersGroup.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
    # def new
    #   super
    #   @user_id = params[:user_id]
    # end
  end
end
