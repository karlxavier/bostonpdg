module Api
  module Simple
    class UsersController < ApplicationController
      before_action :set_user, only: [:show, :update]

      def list
        users = User.all
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
