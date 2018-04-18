class Order < ApplicationRecord

  def created_by_name
    user = User.find(self.created_by)
    user.first_name + " " + user.last_name
  end

  def customer_name
    user = User.find(self.customer)
    user.first_name + " " + user.last_name
  end

  def last_updated_by_name
    user = User.find(self.last_updated_by)
    user.first_name + " " + user.last_name
  end

  def created_date
    self.created_at.strftime('%B %e, %Y')
  end

end
