class Admin::BaseController < ApplicationController
	before_action :is_user_admin
	helper_method :user_notification_count

	def user_notification_count
		@notifications_count = Audit.unread_count(current_user.last_notified)
	end

	def is_user_admin
		if user_signed_in?
			if !current_user.admin?
				redirect_to authenticated_root_path
			end
		end
	end

end