module Api
  module Simple
    class SessionsController < ApplicationController

      # POST /resource/sign_in
      def create
        user = User.find_by_email(params[:email])
        if user.present? && !user.nil?
          if user.valid_password?(params[:password])
            sign_in(user, scope: :user)
            # puts "#{user.valid_password?(params[:password])}"
            render :json => user, :status => :ok

          else
            render :json => {}, :status => :unauthorized
          end
        else
          render :json => {}, :status => :not_found
        end
      end

      # DELETE /resource/sign_out
      def destroy
        redirect_path = after_sign_out_path_for(resource_name)
        signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
        set_flash_message :notice, :signed_out if signed_out && is_navigational_format?

        # We actually need to hardcode this as Rails default responder doesn't
        # support returning empty response on GET request
        respond_to do |format|
          format.all { head :no_content }
          format.any(*navigational_formats) { redirect_to redirect_path }
        end
      end

    end
  end
end