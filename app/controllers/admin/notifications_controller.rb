class Admin::NotificationsController < ApplicationController

	def index
		@audits = Audit.order(created_at: :desc).limit(100)

		current_user.update_attributes(last_notified: Time.zone.now)
	end

end