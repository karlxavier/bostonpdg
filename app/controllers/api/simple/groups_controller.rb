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

    end
  end
end
