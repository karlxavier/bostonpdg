module Api
  module Simple
    class AddressesController < ApplicationController


      def list
        addresses = Address.all
        render json: addresses.map { |address| { id: address.id, state: address.state, city: address.city } }
      end

      def save
        @address = Address.new(addresses_params)
        if @address.save
          render json: @address
        else
          render nothing: true, status: :bad_request
        end
      end

      protected

      def addresses_params
        params[:address]
      end

    end
  end
end
