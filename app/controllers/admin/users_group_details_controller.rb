class Admin::UsersGroupDetailsController < Admin::BaseController

    def create
        @details = UsersGroupDetail.new(details_param)
        respond_to do |format|
            if @details.save
                format.js
            end
        end
    end

    private

        def details_param
            params.require(:users_group_detail).permit(:id, users_group_ids: [])
        end

end