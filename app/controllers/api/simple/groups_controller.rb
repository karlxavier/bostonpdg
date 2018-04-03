module Api
  module Simple
    class GroupsController < ApplicationController
      before_action :set_group, only: [:show, :update]

      def list
        groups = Group.all
        render json: groups.map { |group| { id: group.id, name: group.name } }
      end

      def show
        group = Group.find(params[:id])
        render json: group
      end

      def create
        @group = Group.new(groups_params)
        if @group.save
          render json: @group
        else
          render nothing: true, status: :bad_request
        end
      end

      def update
        if @group.update_attributes(groups_params)
          head :no_content
        else
          render json: { status: 'failed' }, status: :unprocessable_entity
        end
      end

      protected

      def set_group
        @group = Group.find(params[:id])
      end

      def groups_params
        params[:group]
      end

    end
  end
end
