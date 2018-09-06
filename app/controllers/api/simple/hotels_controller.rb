module Api
  module Simple
    class HotelsController < ApplicationController
      def index
        hotels = Hotel.where(:brand_id => params[:brand_id])
        render json: hotels
      end
    end
  end
end
