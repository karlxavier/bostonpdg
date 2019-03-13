class Admin::UserRequestsController < Admin::BaseController

     def index
          @user_requests = UserRequest.all
     end

     def update
          @request = UserRequest.find(params[:id])
          @user_requests = UserRequest.all
          if @request.update_attributes(is_approve: true)
               flash.now[:notice] = "Time Log successfully updated."
           else
               flash.now[:error] = "Cannot update this request."
           end
          render action: :index
     end

     def destroy
          @request = UserRequest.find(params[:id])
          @user_requests = UserRequest.all
          if @request.destroy
              flash.now[:notice] = "User request successfully deleted."
          else
              flash.now[:error] = "Cannot delete this user request, associations still exist."
          end
          render action: :index
      end

end