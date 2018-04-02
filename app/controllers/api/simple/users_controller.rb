module Api
  module Simple
    class UsersController < ApplicationController

      def list
        users = User.all
        render json: users.map { |user| { id: user.id, name: user.first_name + " " + user.last_name, email: user.email } }
      end

      def show
        user = User.find(params[:id])
        render json: user
      end

      def save
        @user = User.new(users_params)
        if @user.save
          render json: @user
        else
          render nothing: true, status: :bad_request
        end
      end

      protected

      def users_params
        params[:user]
      end

    end
  end
end
