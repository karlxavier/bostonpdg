class Admin::GroupsController < ApplicationController
    before_action :set_group, only: [:edit, :update]

    def index
        @groups = Group.all
    end

    def new
        @group = Group.new
    end

    def create
        @group = Group.new(group_params)

        respond_to do |format|
           if @group.save
                format.html { redirect_to admin_groups_path }
            else
                format.html { render 'new' }
            end
        end
    end

    def edit
    end

    def update
        respond_to do |format|
            if @group.update_attributes(group_params)
                format.html { redirect_to admin_groups_path }
            else
                format.html { render 'edit' }
            end
        end
    end

    private

        def group_params
            params.require(:group).permit(:name, :description)
        end

        def set_group
            @group = Group.find(params[:id])
        end
end
