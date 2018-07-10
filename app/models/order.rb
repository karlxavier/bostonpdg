class Order < ApplicationRecord
  has_many :order_users
  has_many :order_entries
  has_many :products, through: :order_entries

  def created_by_name
    if self.created_by.present?
      user = User.find(self.created_by)
      user.first_name + " " + user.last_name
    end

  end

  def customer_name
    if self.customer.present?
      user = User.find(self.customer)
      user.first_name + " " + user.last_name
    end
  end

  def last_updated_by_name
    if self.last_updated_by.present?
      user = User.find(self.last_updated_by)
      user.first_name + " " + user.last_name
    end
  end

  def brand_name
    if self.brand_id.present?
      brand = Brand.find(self.brand_id)
      brand.name
    end
  end

  def brand_branches
    if self.brand_id.present?
      order_branches = OrderBranch.where(:order_id => self.id, :brand_id => self.brand_id)
      str_text = '';
      if order_branches.present? && !order_branches.nil?
        order_branches.each do |ob|
          if str_text == ''
            str_text = ob.city
          else
            str_text = str_text + ', ' +ob.city
          end
        end
      end
      str_text
    end
  end

  def created_date
    self.created_at.strftime('%B %e, %Y')
  end

  def updated_date
    self.updated_at.strftime('%B %e, %Y')
  end

  def art
    arr = []
    arr_ids = []
    order_user = OrderUser.where(:order_id => self.id)
    order_user.each do |ou|
      if ou.art.present? && !ou.art.nil?
        arr_ids.push(ou.art)
      end
    end

    if arr_ids.length > 0
      select_users = User.where("id IN (#{arr_ids.join(',')})")
      all_users = User.where("id NOT IN (#{arr_ids.join(',')})")

      if select_users.present? && !select_users.nil?
        select_users.each do |user|
          arr << {:id => user.id, :name => user.full_name, :view => user.full_name, :selected => true}
        end
      end
    else
      all_users = User.all
    end

    if all_users.present? && !all_users.nil?
      all_users.each do |user|
        arr << {:id => user.id, :name => user.full_name, :view => user.full_name, :selected => false}
      end
    end
    arr
  end

  def regional
    arr = []
    arr_ids = []
    order_user = OrderUser.where(:order_id => self.id)
    order_user.each do |ou|
      if ou.regional.present? && !ou.regional.nil?
        arr_ids.push(ou.regional)
      end
    end

    if arr_ids.length > 0
      select_users = User.where("id IN (#{arr_ids.join(',')})")
      all_users = User.where("id NOT IN (#{arr_ids.join(',')})")

      if select_users.present? && !select_users.nil?
        select_users.each do |user|
          arr << {:id => user.id, :name => user.full_name, :view => user.full_name, :selected => true}
        end
      end
    else
      all_users = User.all
    end

    if all_users.present? && !all_users.nil?
      all_users.each do |user|
        arr << {:id => user.id, :name => user.full_name, :view => user.full_name, :selected => false}
      end
    end
    arr
  end

  def comms
    arr = []
    arr_ids = []
    order_user = OrderUser.where(:order_id => self.id)
    order_user.each do |ou|
      if ou.comms.present? && !ou.comms.nil?
        arr_ids.push(ou.comms)
      end
    end

    if arr_ids.length > 0
      select_users = User.where("id IN (#{arr_ids.join(',')})")
      all_users = User.where("id NOT IN (#{arr_ids.join(',')})")

      if select_users.present? && !select_users.nil?
        select_users.each do |user|
          arr << {:id => user.id, :name => user.full_name, :view => user.full_name, :selected => true}
        end
      end
    else
      all_users = User.all
    end

    if all_users.present? && !all_users.nil?
      all_users.each do |user|
        arr << {:id => user.id, :name => user.full_name, :view => user.full_name, :selected => false}
      end
    end
    arr
  end

  def processor
    arr = []
    arr_ids = []
    order_user = OrderUser.where(:order_id => self.id)
    order_user.each do |ou|
      if ou.processor.present? && !ou.processor.nil?
        arr_ids.push(ou.processor)
      end
    end

    if arr_ids.length > 0
      select_users = User.where("id IN (#{arr_ids.join(',')})")
      all_users = User.where("id NOT IN (#{arr_ids.join(',')})")

      if select_users.present? && !select_users.nil?
        select_users.each do |user|
          arr << {:id => user.id, :name => user.full_name, :view => user.full_name, :selected => true}
        end
      end
    else
      all_users = User.all
    end

    if all_users.present? && !all_users.nil?
      all_users.each do |user|
        arr << {:id => user.id, :name => user.full_name, :view => user.full_name, :selected => false}
      end
    end
    arr
  end

  def designer
    arr = []
    arr_ids = []
    order_user = OrderUser.where(:order_id => self.id)
    order_user.each do |ou|
      if ou.designer.present? && !ou.designer.nil?
        arr_ids.push(ou.designer)
      end
    end

    if arr_ids.length > 0
      select_users = User.where("id IN (#{arr_ids.join(',')})")
      all_users = User.where("id NOT IN (#{arr_ids.join(',')})")

      if select_users.present? && !select_users.nil?
        select_users.each do |user|
          arr << {:id => user.id, :name => user.full_name, :view => user.full_name, :selected => true}
        end
      end
    else
      all_users = User.all
    end

    if all_users.present? && !all_users.nil?
      all_users.each do |user|
        arr << {:id => user.id, :name => user.full_name, :view => user.full_name, :selected => false}
      end
    end
    arr
  end

  def client_contact
    arr = []
    arr_ids = []
    order_user = OrderUser.where(:order_id => self.id)
    order_user.each do |ou|
      if ou.client_contact.present? && !ou.client_contact.nil?
        arr_ids.push(ou.client_contact)
      end
    end

    if arr_ids.length > 0
      select_users = User.where("id IN (#{arr_ids.join(',')})")
      all_users = User.where("id NOT IN (#{arr_ids.join(',')})")

      if select_users.present? && !select_users.nil?
        select_users.each do |user|
          arr << {:id => user.id, :name => user.full_name, :view => user.full_name, :selected => true}
        end
      end
    else
      all_users = User.all
    end

    if all_users.present? && !all_users.nil?
      all_users.each do |user|
        arr << {:id => user.id, :name => user.full_name, :view => user.full_name, :selected => false}
      end
    end
    arr
  end

  def temp_brand
    obj = {}
    brand = Brand.find(self.brand_id)
    if brand.present? && !brand.nil?
      obj = {:id => brand.id, :name => brand.name, :view => brand.name}
    end
    obj
  end




  def regional_users
    arr = []
    arr_ids = []
    order_user = OrderUser.where(:order_id => self.id)
    order_user.each do |ou|
      if ou.regional.present? && !ou.regional.nil?
        arr_ids.push(ou.regional)
      end
    end

    if arr_ids.length > 0
      select_users = User.where("id IN (#{arr_ids.join(',')})")
      if select_users.present? && !select_users.nil?
        select_users.each do |user|
          arr << {:id => user.id, :name => user.full_name, :view => user.full_name}
        end
      end
    end
    arr
  end

  def comms_users
    arr = []
    arr_ids = []
    order_user = OrderUser.where(:order_id => self.id)
    order_user.each do |ou|
      if ou.comms.present? && !ou.comms.nil?
        arr_ids.push(ou.comms)
      end
    end

    if arr_ids.length > 0
      select_users = User.where("id IN (#{arr_ids.join(',')})")
      if select_users.present? && !select_users.nil?
        select_users.each do |user|
          arr << {:id => user.id, :name => user.full_name, :view => user.full_name}
        end
      end
    end
    arr
  end

  def art_users
    arr = []
    arr_ids = []
    order_user = OrderUser.where(:order_id => self.id)
    order_user.each do |ou|
      if ou.art.present? && !ou.art.nil?
        arr_ids.push(ou.art)
      end
    end

    if arr_ids.length > 0
      select_users = User.where("id IN (#{arr_ids.join(',')})")
      if select_users.present? && !select_users.nil?
        select_users.each do |user|
          arr << {:id => user.id, :name => user.full_name, :view => user.full_name}
        end
      end
    end
    arr
  end

  def processor_users
    arr = []
    arr_ids = []
    order_user = OrderUser.where(:order_id => self.id)
    order_user.each do |ou|
      if ou.processor.present? && !ou.processor.nil?
        arr_ids.push(ou.processor)
      end
    end

    if arr_ids.length > 0
      select_users = User.where("id IN (#{arr_ids.join(',')})")
      if select_users.present? && !select_users.nil?
        select_users.each do |user|
          arr << {:id => user.id, :name => user.full_name, :view => user.full_name}
        end
      end
    end
    arr
  end


end
