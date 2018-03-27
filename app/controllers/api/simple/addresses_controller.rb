module Api
  module Simple
    class AddressesController < ApplicationController


      def list
        addresses = Address.all
        render json: addresses.map { |address| { id: address.id, state: address.state, city: address.city } }
      end

    end
  end
end
