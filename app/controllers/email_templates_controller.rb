class EmailTemplatesController < ApplicationController
  def create
    parse_template = params[:email_template]

    @email_template = EmailTemplate.new
    @email_template.order_id = parse_template[:order_id]
    @email_template.user_id = current_user.id
    @email_template.content = parse_template[:content]

    if @email_template.save
      # Email Template Users
      # Order User or Additional Emails:
      parse_template[:cc].split(',').each do |email|
        EmailTemplateUser.create(:email_template_id => @email_template.id, :email => email, :user_type => "cc")
      end
      # Vendors or Additional Emails:
      parse_template[:to].split(',').each do |email|
        EmailTemplateUser.create(:email_template_id => @email_template.id, :email => email, :user_type => "to")
      end
      # Sender:
      if parse_template[:sender].present?
        EmailTemplateUser.create(:email_template_id => @email_template.id, :email => parse_template[:sender], :user_type => "sender")
      else
        EmailTemplateUser.create(:email_template_id => @email_template.id, :email => current_user.email, :user_type => "sender")
      end

      #Email Template Order Entry (Items)
      # Order Entries:
      parse_template[:order_entry_ids].split(',').each do |id|
        EmailTemplateOrderEntry.create(:email_template_id => @email_template.id, :order_entry_id => id.to_i)
      end

      #Email Template Attachment
      # Attachments:
      parse_template[:attachment_file].each do |attachment_file|
        email_template_attachment = EmailTemplateAttachment.new
        email_template_attachment.email_template_id = @email_template.id
        email_template_attachment.attachment_file = attachment_file
        email_template_attachment.save
      end

      EmailTemplateUser.where(:email_template_id => @email_template.id, :user_type => "to").pluck(:email).each do |email|
        OrderMailer.send_request_quote(@email_template, email).deliver_now
      end

      flash[:notice] = "Request Quote Successfully Sent."
    else
      flash[:error] = "Request Quote Sent Failure!"
    end
    @order = Order.find(parse_template[:order_id])
    redirect_to orders_path(@order)
  end
end