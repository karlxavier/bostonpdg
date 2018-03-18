module Api
  module Simple
    class UsersController < ApplicationController

      def list
        users = User.all
        render json: users.map { |user| { id: user.id, name: user.first_name + " " + user.last_name, email: user.email } }
      end

    end
  end
end
