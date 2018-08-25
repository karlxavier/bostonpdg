class OrderMailer < ApplicationMailer

  def send_order_entries
    @vendor = params[:vendor]
    @order = params[:order]
    @order_entries = params[:order_entries]
    @products = Product.all
    attachments.inline['logo.png'] = File.read("#{Rails.root}/app/assets/images/logo.png")
    @order_entries.each do |oe|
      if oe.picture_url != ""
        attachments.inline["#{oe.id}.png"] = File.read(oe.picture_url)
      end
    end
    mail(
        :from => "jerico@maddington.net",
        :to => @vendor.email,
        :subject => "Order Ticket ##{@order.id}"
    )
  end

  def send_request_quote(email_template, to_user)
    @email_template = email_template
    order_entry_ids = EmailTemplateOrderEntry.where(:email_template_id => email_template.id).pluck(:order_entry_id)
    if order_entry_ids.length > 0
      @order_entries = OrderEntry.where("id IN (#{order_entry_ids.map(&:inspect).join(',')})")
    end
    @cc = EmailTemplateUser.where(:email_template_id => email_template.id, :user_type => 'cc').pluck(:email)
    @sender = EmailTemplateUser.where(:email_template_id => email_template.id, :user_type => 'sender').first
    @subject = "Order Ticket ##{email_template.id}"
    EmailTemplateAttachment.where(:email_template_id => email_template.id).each do |eta|
      if eta.attachment_file.path(:original) != ""
        attachments.inline["#{eta.attachment_file.original_filename}"] = File.read(eta.attachment_file.path(:original))
      end
    end
    mail(
        :from => @sender.email,
        :to => to_user,
        :cc => @cc,
        :subject => @subject
    )
  end

end
