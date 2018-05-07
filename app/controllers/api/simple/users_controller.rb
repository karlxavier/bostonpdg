module Api
  module Simple
    class UsersController < ApplicationController
      before_action :set_user, only: [:show, :update]

      def list
        users = User.all
        render json: users.map { |user| { id: user.id, name: user.first_name + " " + user.last_name, email: user.email, password: user.encrypted_password } }
      end

      def branch_users
        users = User.where("id IN (SELECT user_id FROM users_brands WHERE brand_id = #{params[:brand_id]}) AND (billing_address IN (#{params[:addresses]}) OR shipping_address IN (#{params[:addresses]}))")
        render json: users.map { |user| { id: user.id, name: user.first_name + " " + user.last_name, email: user.email } }
      end

      def show
        render json: @user
      end

      def create
        @user = User.new(users_params)
        if @user.save
          render json: @user
        else
          render nothing: true, status: :bad_request
        end
      end

      def update
        if @user.update_attributes(users_params)
          head :no_content
        else
          render json: { status: 'failed' }, status: :unprocessable_entity
        end
      end


      def login
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

      def forgot_password
        @user = User.find_by_email(params[:email])
        if @user.present?
          @user.send_reset_password_instructions
          render :json => @user, :status => :ok
        else
          render :json => {}, :status => :not_found
        end
      end

      protected

      def set_user
        @user = User.find(params[:id])
      end

      def users_params
        params[:user]
      end

    end
  end
end
