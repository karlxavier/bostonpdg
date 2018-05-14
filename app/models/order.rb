class Order < ApplicationRecord

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
=begin
    art = []
    order_users = OrderUser.where(:order_id => self.id).order("created_at ASC")
    if order_users.present? && !order_users.nil?
      order_users.each do |ou|
        if ou.art.present? && !ou.art.nil?
          art << ou.art
        end
      end
    end
    art
=end
    obj = {}
    order_users = OrderUser.where(:order_id => self.id).limit(1)
    if order_users.present? && !order_users.nil?
      order_users.each do |ou|
        if ou.art.present? && !ou.art.nil?
          user = User.find(ou.art)
          obj = {:id => user.id, :name => user.full_name, :view => user.full_name}
        end
      end
    end
    obj
  end

  def regional
=begin
    regional = []
    order_users = OrderUser.where(:order_id => self.id).order("created_at ASC")
    if order_users.present? && !order_users.nil?
      order_users.each do |ou|
        if ou.regional.present? && !ou.regional.nil?
          regional << ou.regional
        end
      end
    end
    regional
=end
    obj = {}
    order_users = OrderUser.where(:order_id => self.id).limit(1)
    if order_users.present? && !order_users.nil?
      order_users.each do |ou|
        if ou.regional.present? && !ou.regional.nil?
          user = User.find(ou.regional)
          obj = {:id => user.id, :name => user.full_name, :view => user.full_name}
        end
      end
    end
    obj
  end

  def comms
=begin
    comms = []
    order_users = OrderUser.where(:order_id => self.id).order("created_at ASC")
    if order_users.present? && !order_users.nil?
      order_users.each do |ou|
        if ou.comms.present? && !ou.comms.nil?
          comms << ou.comms
        end
      end
    end
    comms
=end
    obj = {}
    order_users = OrderUser.where(:order_id => self.id).limit(1)
    if order_users.present? && !order_users.nil?
      order_users.each do |ou|
        if ou.comms.present? && !ou.comms.nil?
          user = User.find(ou.comms)
          obj = {:id => user.id, :name => user.full_name, :view => user.full_name}
        end
      end
    end
    obj
  end

  def processor
=begin
    processor = []
    order_users = OrderUser.where(:order_id => self.id).order("created_at ASC")
    if order_users.present? && !order_users.nil?
      order_users.each do |ou|
        if ou.processor.present? && !ou.processor.nil?
          processor << ou.processor
        end
      end
    end
    processor
=end
    obj = {}
    order_users = OrderUser.where(:order_id => self.id).limit(1)
    if order_users.present? && !order_users.nil?
      order_users.each do |ou|
        if ou.processor.present? && !ou.processor.nil?
          user = User.find(ou.processor)
          obj = {:id => user.id, :name => user.full_name, :view => user.full_name}
        end
      end
    end
    obj
  end

  def temp_brand
    obj = {}
    brand = Brand.find(self.brand_id)
    if brand.present? && !brand.nil?
      obj = {:id => brand.id, :name => brand.name, :view => brand.name}
    end
    obj
  end


end
