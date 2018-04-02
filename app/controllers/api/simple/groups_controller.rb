module Api
  module Simple
    class GroupsController < ApplicationController

      def list
        groups = Group.all
        render json: groups.map { |group| { id: group.id, name: group.name } }
      end

      def show
        group = Group.find(params[:id])
        render json: group
      end

      def save
        @group = Group.new(groups_params)
        if @group.save
          render json: @group
        else
          render nothing: true, status: :bad_request
        end
      end

      protected

      def groups_params
        params[:group]
      end

    end
  end
end
