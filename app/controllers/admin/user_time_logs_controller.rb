class Admin::UserTimeLogsController < ApplicationController
    before_action :set_user_time_log, only: [:edit, :update, :show, :destroy]

    def index
        @user_time_logs = UserTimeLog.all
    end

    def new
        @user_time_log = UserTimeLog.new
    end

    def create
        @user_time_log = UserTimeLog.new(user_time_log_params)

        respond_to do |format|
           if @user_time_log.save
                format.html { redirect_to admin_user_time_logs_path }
            else
                format.html { render 'new' }
            end
        end
    end

    def edit
    end

    def show
        @user_time_log = UserTimeLog.new
    end

    def update
        respond_to do |format|
            if @user_time_log.update_attributes(user_time_log_params)
                format.html { redirect_to admin_user_time_logs_path }
            else
                format.html { render 'edit' }
            end
        end
    end

    def destroy
        @user_time_logs = UserTimeLog.all
        if @user_time_log.destroy
            flash.now[:notice] = "Time Log successfully deleted."
        else
            flash.now[:error] = "Cannot delete this time log, associations still exist."
        end
        render action: :index
    end

    def import_csv
        UserTimeLog.import(params[:file])
        redirect_to admin_user_time_logs_path
    end

    private

        def user_time_log_params
            params.require(:user_time_log).permit(:time_in, :time_out, :user_id, :duration, :active, :office_time_log_id)
        end

        def set_user_time_log
            @user_time_log = UserTimeLog.find(params[:id])
        end


end