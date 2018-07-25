module ApplicationHelper
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
      @txt = 'None'
    elsif status == 1
      @txt = 'Quoted'
    elsif status == 2
      @txt = 'Ordered'
    elsif status == 3
      @txt = 'Pending'
    elsif status == 4
      @txt = 'Shipped'
    end
    @txt
  end

  def check_picture_url entry
    product = Product.find(entry.product_id)
    product.picture_url
  end
end
