module Api
  module Simple
    class GroupsController < ApplicationController

      def list
        groups = Group.all
        render json: groups.map { |group| { id: group.id, name: group.name } }
      end

    end
  end
end
