class Admin::UsersController < Admin::BaseController
	before_action :set_user, only: [:edit, :update, :destroy]

    def index
    	@users = User.all
    end

    def new
    	@user = User.new
    end

    def create
        @user = User.new(user_params)

        respond_to do |format|
           if @user.save
                format.html { redirect_to admin_users_path }
            else
                format.html { render 'new' }
            end
        end
    end

    def edit
        session[:return_to] ||= request.referer
    end

    def update
    	respond_to do |format|
			if @user.update_attributes(user_params)
                # format.html { redirect_to admin_users_path }
                format.html { redirect_to session.delete(:return_to) } 
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
    		params.require(:user).permit(:email, :password, :password_confirmation, :role_mask, :admin, :billing_address, :shipping_address, :first_name, 
    									:last_name, :brand_id, :group_id, :mobile, :notes, :active, :title, :phone, 
    									:customer_id, :vendor_id, :regional_director, :client_contacts, :communications,
                                        :art_director, :designers, :processor, :ip_address)
    	end

    	def set_user
    		@user = User.find(params[:id])
    	end

end

