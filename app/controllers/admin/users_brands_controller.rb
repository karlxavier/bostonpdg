class Admin::UsersBrandsController < Admin::BaseController

    def create
        @users_brand = UsersBrand.new(ub_params)

        respond_to do |format|
            if @users_brand.save

                @brand = @users_brand.brand
                format.js
            end
        end
    end

    def destroy
        @users_brand = UsersBrand.find(params[:id])
        @brand = @users_brand.brand
        respond_to do |format|
            @users_brand.destroy

            format.js
        end
    end

    def update
        @users_brand = UsersBrand.find(params[:id])
        @brand = @users_brand.brand
        respond_to do |format|
            if @users_brand.main_contact == true
                @users_brand.update(main_contact: false)
            else
                @users_brand.update(main_contact: true)
            end
            
            format.js
        end
    end

    private

    def ub_params
        params.require(:users_brand).permit(:user_id, :brand_id, :main_contact)
    end

end
