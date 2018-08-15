class Admin::ApplicationController < ApplicationController
    before_action :authenticate_admin

    def authenticate_admin
      # TODO Add authentication logic here.
    end


end
