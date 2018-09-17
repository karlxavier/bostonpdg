class Admin::UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update, :destroy]

    def index
    	@users = User.all
    end

    def new
    	@user = User.new
    end

    def create
    end

    def edit
    end

    def update
    	respond_to do |format|
			if @user.update_attributes(user_params)
				format.html { redirect_to admin_users_path }
			else
				format.html	{ render 'edit' }
			end
		end
    end

    def destroy
        @users = User.all
        if @user.destroy
            flash.now[:notice] = "User #{@user.full_name} successfully deleted."
        else
            flash.now[:error] = "Cannot delete this user, associations still exist."
        end
        render action: :index
    end

    private

    	def user_params
    		params.require(:user).permit(:email, :role_mask, :admin, :billing_address, :shipping_address, :first_name, 
    									:last_name, :brand_id, :group_id, :mobile, :notes, :active, :title, :phone, 
    									:customer_id, :vendor_id, :regional_director, :client_contacts, :communications,
                                        :art_director, :designers, :processor)
    	end

    	def set_user
    		@user = User.find(params[:id])
    	end

end

