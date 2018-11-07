module ApplicationHelper

  def remove_unwanted_words string
    bad_words = ["less than", "about", " "]
  
    bad_words.each do |bad|
      string.gsub!(bad, '')
    end
  
    return string
  end

  def replace_unwanted_words string
    replacements = [ ["halfaminute", "30s"], ["aminute", "1m"], ["minutes", "m"], ["minute", "m"], ["hours", "h"], ["hour", "h"], ["seconds", "s"] ]
    replacements.each {|replacement| string.gsub!(replacement[0], replacement[1])}
  
    return string
  end

  def get_vendor_link id
    vendor = Vendor.find(id)
    link_to vendor.name, admin_vendor_path(vendor)
  end

  def get_product_link id
    product = Product.find(id)
    link_to product.name, admin_product_path(vendor)
  end

  def get_user_link id
    user = User.find(id)
    link_to user.first_name + ' ' + user.last_name, admin_user_path(vendor)
  end

  def generate_history_information history
    @str_text = "#{history.created_at.strftime('%B %e, %Y')}: "
    @user = User.find(history.user_id)
    if history.order_entry_id.present? && !history.order_entry_id.nil? && history.order_entry_id != ""
      order_entry = OrderEntry.where(id: history.order_entry_id).first 
    
      if order_entry.present?
        product = Product.where(id: order_entry.product_id).first
      end  
     
      if order_entry.present? && product.present?
         @str_text = @str_text + "#{product.name} #{history.description} by #{@user.full_name}"
      else
         @str_text = ""
      end  
     
    elsif history.product_id.present? && !history.product_id.nil? && history.product_id != ""
      product = Product.where(id: history.product_id).first
      if product.present?
        @str_text = @str_text + "#{product.name} #{history.description} from Order ##{history.order_id} by #{@user.full_name}"
      else
        @str_text = ""
      end
    else
      @str_text = @str_text + "Order ##{history.order_id} #{history.description} by #{@user.full_name}"
    end
    @str_text
  end

  def get_status status
    @txt = ''
    if status == 0
      @txt = 'New'
    elsif status == 1
      @txt = 'Quoting'
    elsif status == 2
      @txt = 'Pending Approval'
    elsif status == 3
      @txt = 'Ready to Process'
    elsif status == 4
      @txt = 'In Production'
    elsif status == 5
      @txt = 'Shipped'
    elsif status == 6
      @txt = 'Delivered'
    end
    @txt
  end

  def check_picture_url entry
    product = Product.find(entry.product_id)
    product.picture_url
  end

  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)}", role: "alert") do 
              concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat message 
            end)
    end
    nil
  end


end
