module Api
  module Simple
    class AddressesController < ApplicationController


      def list
        addresses = Address.all
        render json: addresses.map { |address| { id: address.id, name: address.street + " " + address.street_2 } }
      end

    end
  end
end
