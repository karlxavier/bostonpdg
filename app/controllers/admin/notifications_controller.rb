class Admin::NotificationsController < ApplicationController

	def index
		@audits = Audit.order(created_at: :desc).limit(100)
	end

end