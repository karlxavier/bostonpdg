class OrderMailer < ApplicationMailer
  default from: 'jerico@maddington.net'

  def send_order_entries
    @vendor = params[:vendor]
    @order = params[:order]
    @order_entries = params[:order_entries]
    @products = Product.all
    mail(
        :from => "jerico@maddington.net",
        :to => @vendor.email,
        :subject => "Order Ticket ##{@order.id}"
    )
  end

end
