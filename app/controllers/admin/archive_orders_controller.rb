class Admin::ArchiveOrdersController < Admin::BaseController

	def index
		@archive_orders = Order.where(order_status_id: 6).order(id: :desc)
	end

end