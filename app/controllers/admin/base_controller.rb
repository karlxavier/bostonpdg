class Admin::BaseController < ActionController::Base
	helper_method :user_notification_count

	def user_notification_count
		@notifications_count = Audit.unread_count(current_user.last_notified)
	end

end