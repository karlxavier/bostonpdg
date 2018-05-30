module Api
  module Simple
    class AddressesController < ApplicationController
      before_action :set_address, only: [:show, :update]

      def list
        addresses = Address.all
        render json: addresses.map { |address| { id: address.id, state: address.state, city: address.city } }
      end

      def branches
        addresses = Address.where("id IN (SELECT billing_address FROM users WHERE id IN (SELECT user_id FROM users_brands WHERE brand_id = #{params[:brand_id]}))  OR id IN (SELECT shipping_address FROM users WHERE id IN (SELECT user_id FROM users_brands WHERE brand_id = #{params[:brand_id]}))")
        render json: addresses.map { |address| { id: address.id, state: address.state, city: address.city } }
      end

      def create
        @address = Address.new(addresses_params)
        if @address.save
          render json: @address
        else
          render nothing: true, status: :bad_request
        end
      end

      def update
        if @address.update_attributes(addresses_params)
          head :no_content
        else
          render json: { status: 'failed' }, status: :unprocessable_entity
        end
      end

      def show
        render json: @address
      end

      protected

      def set_address
        @address = Address.find(params[:id])
      end

      def addresses_params
        params[:address]
      end

    end
  end
end
